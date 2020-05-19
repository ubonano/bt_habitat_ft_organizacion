import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bt_habitat_ft_organizacion/models/moment_model.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/impl/firebase/moment_firebase_repository.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/widgets/moment/moment_widget.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/widgets/moments/bloc/moments_bloc.dart';

class MomentsWidget extends StatelessWidget {
  final Workshop workshop;

  const MomentsWidget({Key key, @required this.workshop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MomentsBloc>(
      create: (context) =>
          MomentsBloc(momentsRepository: MomentFirebaseRepository(workshop.id))
            ..init(),
      child: Column(
        children: <Widget>[
          _buildHeaderMoments(),
          _buildBodyMoments(workshop.id),
        ],
      ),
    );
  }

  Widget _buildHeaderMoments() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 40,
      color: Color(0xFF6c8ebf),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Momentos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildBodyMoments(String workshopId) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xFFCCCCCC),
      child: BlocBuilder<MomentsBloc, MomentsState>(
        builder: (context, state) {
          if (state is MomentsInitial || state is MomentsLoadInProgress) {
            return Container();
          } else if (state is MomentsLoadSuccess) {
            final List<Moment> moments = state.moments;

            return ListView.builder(
              shrinkWrap: true,
              itemCount: moments.length,
              itemBuilder: (context, index) => MomentWidget(workshopId: workshopId, moment: moments[index],),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildMoment() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 30,
      color: Colors.lightGreen,
    );
  }
}
