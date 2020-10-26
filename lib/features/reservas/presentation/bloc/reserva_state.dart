import 'package:backend_tp_p2/features/reservas/data/models/reserva_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ReservaState {}

class ReservaInitial extends ReservaState {}

class ReservaInProgress extends ReservaState {}

class ClientNotRegistered extends ReservaState {}

class ReservaSuccess extends ReservaState {
  final ReservaModel reservaModel;

  ReservaSuccess({@required this.reservaModel});

}

class ReservaFailure extends ReservaState {
  final String message;

  ReservaFailure({@required this.message});

}
