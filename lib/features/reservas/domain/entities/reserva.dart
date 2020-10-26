import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'mesa.dart';

class Reserva extends Equatable {
  final String mesaId;
  final String ci;
  final DateTime fecha;
  final List<String> rangos;
  String clienteId;
  Mesa mesa;

  Reserva(
      {@required this.mesaId,
      @required this.ci,
      @required this.fecha,
      @required this.rangos,
      this.clienteId,
        this.mesa,
      });

  @override
  List<Object> get props => [mesaId, ci, fecha, rangos, clienteId, mesa];

  @override
  bool get stringify => true;
}
