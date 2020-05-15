import 'package:bt_habitat_ft_organizacion/models/moment_model.dart';

abstract class MomentsRepository {
  
  Stream<List<Moment>> moments();

}