import 'package:backend_tp_p2/features/reservas/data/models/reserva_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ReservaEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ReservaRequested extends ReservaEvent {
  final ReservaModel reservaModel;

  ReservaRequested({@required this.reservaModel});

  @override
  List<Object> get props => [reservaModel];
}

class RegisterAndReservaRequested extends ReservaEvent {
  final ReservaModel reservaModel;
  final String nombre;
  final String apellido;
  final String ci;

  RegisterAndReservaRequested(
      {@required this.reservaModel,
      @required this.nombre,
      @required this.apellido,
      @required this.ci});

  @override
  List<Object> get props => [reservaModel, nombre, apellido, ci];
}
