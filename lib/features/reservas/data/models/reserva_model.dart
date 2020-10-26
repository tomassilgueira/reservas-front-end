import 'dart:convert';

import 'package:backend_tp_p2/features/reservas/data/models/mesa_model.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/reserva.dart';
import 'package:meta/meta.dart';

class ReservaModel extends Reserva {
  ReservaModel({@required mesaId, @required ci, @required fecha, @required rangos, clienteId, mesa})
      : super(mesaId: mesaId, ci: ci, fecha: fecha, rangos: rangos, clienteId: clienteId, mesa: mesa);
  factory ReservaModel.fromJson(Map<String, dynamic> json) {
    return ReservaModel(
      mesaId: json['mesaId'],
      ci: json['ci'],
      clienteId: json['clienteId'],
      fecha: DateTime.parse(json['fecha']),
      rangos: List<String>.from(json['rangos'].map((x) => x)),
      mesa: MesaModel.fromJson(json['mesa']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "mesaId": int.parse(mesaId),
      "ci": ci,
      "fecha": json.encode(fecha.toIso8601String()).replaceAll('\"', ''),
      "rangos": rangos.toString(),
    };
  }

}