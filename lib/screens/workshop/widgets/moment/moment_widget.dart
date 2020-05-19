import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bt_habitat_ft_organizacion/repositories/impl/firebase/component_firebase_repository.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/widgets/component_widget/bloc/component_bloc.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/widgets/component_widget/compoment_widget.dart';

import 'package:bt_habitat_ft_organizacion/models/moment_model.dart';

class MomentWidget extends StatelessWidget {
  final String workshopId;
  final Moment moment;

  const MomentWidget(
      {Key key, @required this.workshopId, @required this.moment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComponentBloc>(
      create: (context) => ComponentBloc(
          repository: ComponentFirebaseRepository(workshopId, moment.id))
        ..add(ListComponentStarted()),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: <Widget>[
            _buildHeaderMoment(),
            _buildBodyMoment(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderMoment() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 40,
      color: Colors.green,
      child: Align(
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
}
