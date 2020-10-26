import 'package:backend_tp_p2/features/reservas/domain/entities/restaurant.dart';
import 'package:meta/meta.dart';

class RestaurantModel extends Restaurant {
  RestaurantModel({@required id, @required nombre, @required descripcion})
      : super(id: id, nombre: nombre, descripcion: descripcion);
  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
    );
  }
}