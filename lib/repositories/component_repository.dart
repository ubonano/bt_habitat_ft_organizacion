import 'package:bt_habitat_ft_organizacion/models/component_model.dart';

abstract class ComponentRepository {
  
  Stream<List<Component>> all();

}