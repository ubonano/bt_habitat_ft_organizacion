import 'package:bt_habitat_ft_organizacion/component/bloc/component_bloc.dart';
import 'package:bt_habitat_ft_organizacion/component/component_type.dart';
import 'package:bt_habitat_ft_organizacion/component/component_widget.dart';
import 'package:bt_habitat_ft_organizacion/component/model/component_document_model.dart';
import 'package:bt_habitat_ft_organizacion/component/model/component_image_model.dart';
import 'package:bt_habitat_ft_organizacion/component/model/component_video_model.dart';
import 'package:bt_habitat_ft_organizacion/moment/bloc/moment_bloc.dart';
import 'package:bt_habitat_ft_organizacion/moment/moment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MomentWidget extends StatelessWidget {
  final String workshopId;
  final Moment moment;

  const MomentWidget(
      {Key key, @required this.workshopId, @required this.moment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComponentBloc>(
      create: (context) =>
          ComponentBloc(workshopId, moment.id)..add(ListComponentStarted()),
      child: _Moment(
        workshopId: workshopId,
        moment: moment,
      ),
    );
  }
}

class _Moment extends StatelessWidget {
  final String workshopId;
  final Moment moment;

  const _Moment({Key key, this.workshopId, this.moment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ComponentBloc componentBloc = BlocProvider.of<ComponentBloc>(context);

    return BlocListener<ComponentBloc, ComponentState>(
      listener: (context, state) {
        if (state is AddComponentSuccess) {
          Navigator.pop(context);
        }
      },
      child: Container(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: <Widget>[
              _buildHeaderMoment(context, componentBloc),
              _buildBodyMoment(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderMoment(BuildContext context, ComponentBloc componentBloc) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 40,
      color: Colors.green,
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${moment.title}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(child: Container()),
          IconButton(
              icon: Icon(Icons.delete, color: Colors.white),
              onPressed: () => BlocProvider.of<MomentBloc>(context)
                  .add(DeleteMomentStarted(moment.id))),
          PopupMenuButton(
            child: Icon(Icons.add, color: Colors.white),
            tooltip: 'Agregar un componente',
            onSelected: (value) =>
                _showAlertDialog(value, context, componentBloc),
            itemBuilder: (context) {
              return [
                _buildPopupMenuItem(
                    ComponentType.getIconByType(ComponentType.video),
                    'Video',
                    ComponentType.video),
                _buildPopupMenuItem(
                    ComponentType.getIconByType(ComponentType.image),
                    'Imagen',
                    ComponentType.image),
                _buildPopupMenuItem(
                    ComponentType.getIconByType(ComponentType.document),
                    'Documento',
                    ComponentType.document),
              ];
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBodyMoment() {
    return BlocBuilder<ComponentBloc, ComponentState>(
      builder: (context, state) {
        if (state is ListComponentinProcess) {
          return CircularProgressIndicator();
        } else if (state is ListComponentSuccess) {
          return Container(
            color: Color(0xFF7da5de),
            child: Column(
              children: state.components
                  .map((c) => ComponentWidget(component: c, momentId: moment.id, workshopId: workshopId,))
                  .toList(),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  void _showAlertDialog(
      String type, BuildContext context, ComponentBloc componentBloc) {
    if (type == ComponentType.video) {
      _addVideoComponent(context, componentBloc);
    } else if (type == ComponentType.document) {
      _addDocumentComponent(context, componentBloc);
    } else if (type == ComponentType.image) {
      _addImageComponent(context, componentBloc);
    }
  }

  void _addVideoComponent(BuildContext context, ComponentBloc componentBloc) {
    TextEditingController ctrlTitle = TextEditingController();
    TextEditingController ctrlLink = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ComponentType.iconVideo(),
            SizedBox(
              width: 15,
            ),
            Text('Agregar Video'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: ctrlTitle,
              decoration: InputDecoration(
                hintText: 'Agregar un titulo',
                labelText: 'Titulo',
              ),
            ),
            TextFormField(
              controller: ctrlLink,
              decoration: InputDecoration(
                hintText: 'Agregar el link',
                labelText: 'Link del video',
              ),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
          ),
          FlatButton(
            onPressed: () {
              componentBloc.add(AddComponentStarted(ComponentVideo(
                  title: ctrlTitle.text,
                  type: ComponentType.video,
                  link: ctrlLink.text)));
            },
            child: Text('Aceptar',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _addDocumentComponent(
      BuildContext context, ComponentBloc componentBloc) {
    TextEditingController ctrlTitle = TextEditingController();
    TextEditingController ctrlDocument = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ComponentType.icondocument(),
            SizedBox(
              width: 15,
            ),
            Text('Agregar Documento'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: ctrlTitle,
              decoration: InputDecoration(
                hintText: 'Agregar un titulo',
                labelText: 'Titulo',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Subir un documento',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.cloud_upload,
                      color: Colors.white,
                    ),
                  ],
                ),
                color: Colors.pink,
                onPressed: () {}),
          ],
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancelar',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              )),
          FlatButton(
            onPressed: () => componentBloc.add(AddComponentStarted(
              ComponentDocument(
                  title: ctrlTitle.text,
                  type: ComponentType.document,
                  document: ctrlDocument.text),
            )),
            child: Text(
              'Aceptar',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void _addImageComponent(BuildContext context, ComponentBloc componentBloc) {
    TextEditingController ctrlTitle = TextEditingController();
    TextEditingController ctrlImage = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ComponentType.iconImage(),
            SizedBox(
              width: 15,
            ),
            Text('Agregar Imagen'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: ctrlTitle,
              decoration: InputDecoration(
                hintText: 'Agregar un titulo',
                labelText: 'Titulo',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Subir una imagen',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.cloud_upload,
                      color: Colors.white,
                    ),
                  ],
                ),
                color: Colors.purpleAccent,
                onPressed: () {}),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancelar',
              style: TextStyle(
                  color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          FlatButton(
            onPressed: () => componentBloc.add(AddComponentStarted(
                ComponentImage(
                    title: ctrlTitle.text,
                    type: ComponentType.image,
                    image: ctrlImage.text))),
            child: Text(
              'Aceptar',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(Icon icon, String text, String value) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          icon,
          SizedBox(
            width: 10,
          ),
          Text(text),
        ],
      ),
      value: value,
    );
  }
}
