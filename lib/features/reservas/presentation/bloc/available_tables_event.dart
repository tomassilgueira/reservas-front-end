import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AvailableTablesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AvailableTablesLoadStarted extends AvailableTablesEvent {
  final String restauranteId;
  final List<String> rangos;
  final DateTime fecha;

  AvailableTablesLoadStarted(
      {@required this.restauranteId,
      @required this.rangos,
      @required this.fecha});

  @override
  List<Object> get props => [restauranteId, rangos, fecha];
}
