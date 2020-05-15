import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';

abstract class WorkshopRepository {
  
  Stream<List<Workshop>> workshops();
  
  Future<void> addNewWorkshop(Workshop workshop);

}