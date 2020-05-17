import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';

abstract class WorkshopRepository {
  
  Stream<List<Workshop>> all();
  
  Future<void> add(Workshop workshop);

  Future<void> delete(String workshopId);

}