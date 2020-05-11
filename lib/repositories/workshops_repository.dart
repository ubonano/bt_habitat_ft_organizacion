import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';

abstract class WorkshopsRepository {
  
  Stream<List<Workshop>> workshops();

}