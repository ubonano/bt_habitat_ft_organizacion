import 'package:bt_habitat_ft_organizacion/models/moment_model.dart';

abstract class MomentRepository {
  
  Stream<List<Moment>> all();

}