import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class FilteredReservasEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FilteredReservasLoadStarted extends FilteredReservasEvent {
  final String restauranteId;
  final String clienteId;
  final DateTime fecha;

  FilteredReservasLoadStarted(
      {@required this.restauranteId,
      @required this.clienteId,
      @required this.fecha});

  @override
  List<Object> get props => [restauranteId, clienteId, fecha];
}
