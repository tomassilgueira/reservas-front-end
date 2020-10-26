import 'package:backend_tp_p2/features/reservas/domain/entities/mesa.dart';
import 'package:meta/meta.dart';

class MesaModel extends Mesa {
  MesaModel(
      {@required id,
      @required nombre,
      @required x,
      @required y,
      @required planta,
      @required capacidad,
      @required restaurantId,
      })
      : super(
            id: id,
            nombre: nombre,
            x: x,
            y: y,
            planta: planta,
            capacidad: capacidad,
            restaurantId: restaurantId,
  );
  factory MesaModel.fromJson(Map<String, dynamic> json) {
    return MesaModel(
      id: json['id'],
      nombre: json['nombre'],
      x: json['x'].toInt(),
      y: json['y'].toInt(),
      planta: json['planta'].toInt(),
      capacidad: json['capacidad'].toInt(),
      restaurantId: json['restauranteId'],
    );
  }
}
