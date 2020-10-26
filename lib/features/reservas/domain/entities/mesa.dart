import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Mesa extends Equatable {
  final String id;
  final String nombre;
  final int x;
  final int y;
  final int planta;
  final int capacidad;
  final String restaurantId;

  const Mesa(
      {@required this.id,
      @required this.nombre,
      @required this.x,
      @required this.y,
      @required this.planta,
      @required this.capacidad,
      @required this.restaurantId,
      });

  @override
  List<Object> get props => [id, nombre, x, y, planta, capacidad, restaurantId];

  @override
  bool get stringify => true;
}
