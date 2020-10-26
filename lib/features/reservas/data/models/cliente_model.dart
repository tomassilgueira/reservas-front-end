import 'package:backend_tp_p2/features/reservas/domain/entities/cliente.dart';
import 'package:meta/meta.dart';

class ClienteModel extends Cliente {
  ClienteModel(
      {@required id, @required nombre, @required apellido, @required ci})
      : super(id: id, nombre: nombre, apellido: apellido, ci: ci);
  factory ClienteModel.fromJson(Map<String, dynamic> json) {
    return ClienteModel(
      id: json['id'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      ci: json['ci'],
    );
  }
}
