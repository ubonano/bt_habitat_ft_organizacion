import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bt_habitat_ft_organizacion/component/bloc/component_bloc.dart';
import 'package:bt_habitat_ft_organizacion/component/component_type.dart';
import 'package:bt_habitat_ft_organizacion/component/component_widget.dart';
import 'package:bt_habitat_ft_organizacion/component/model/component_video_model.dart';
import 'package:bt_habitat_ft_organizacion/moment/moment_model.dart';

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
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => _addVideoComponent(context, componentBloc),
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
                  .map((c) => ComponentWidget(component: c))
                  .toList(),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  void _addVideoComponent(BuildContext context, ComponentBloc componentBloc) {
    TextEditingController controllerTitle = TextEditingController();
    TextEditingController controllerlink = TextEditingController();

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
              controller: controllerTitle,
              decoration: InputDecoration(
                hintText: 'Agregar un titulo',
                labelText: 'Titulo',
              ),
            ),
            TextFormField(
              controller: controllerlink,
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
            child: Text('Cancelar'),
          ),
          FlatButton(
            onPressed: () {
              componentBloc.add(AddComponentStarted(ComponentVideo(
                  title: controllerTitle.text,
                  type: ComponentType.video,
                  link: controllerlink.text)));
            },
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  // void _addDocumentComponent(
  //     BuildContext context, ComponentBloc componentBloc) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text('Agregar Video'),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           TextFormField(
  //             decoration: InputDecoration(
  //               hintText: 'Agregar un titulo',
  //               labelText: 'Titulo',
  //             ),
  //           ),
  //         ],
  //       ),
  //       actions: <Widget>[
  //         FlatButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text('Cancelar'),
  //         ),
  //         FlatButton(
  //           onPressed: () => componentBloc.add(AddComponentStarted(
  //               Component(title: 'Julieta', type: ComponentType.document))),
  //           child: Text('Aceptar'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _addPhotoComponent(BuildContext context, ComponentBloc componentBloc) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text('Agregar Video'),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           TextFormField(
  //             decoration: InputDecoration(
  //               hintText: 'Agregar un titulo',
  //               labelText: 'Titulo',
  //             ),
  //           ),
  //         ],
  //       ),
  //       actions: <Widget>[
  //         FlatButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text('Cancelar'),
  //         ),
  //         FlatButton(
  //           onPressed: () => componentBloc.add(AddComponentStarted(
  //               Component(title: 'Julieta', type: ComponentType.image))),
  //           child: Text('Aceptar'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
