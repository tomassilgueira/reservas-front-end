import 'package:backend_tp_p2/features/reservas/domain/entities/reserva.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FilteredReservasState {}

class FilteredReservasUninitialized extends FilteredReservasState {}

class FilteredReservasLoadInProgress extends FilteredReservasState {}

class FilteredReservasLoadSuccess extends FilteredReservasState {
  final List<Reserva> reservas;

  FilteredReservasLoadSuccess copyWith({List<Reserva> reservas}) {
    return FilteredReservasLoadSuccess(reservas: reservas ?? this.reservas);
  }

  FilteredReservasLoadSuccess({@required this.reservas});
}

class FilteredReservasLoadError extends FilteredReservasState {
  final String message;

  FilteredReservasLoadError({@required this.message});

  @override
  String toString() => 'FilteredReservasLoadError { error: $message }';
}

