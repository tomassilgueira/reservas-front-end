import 'package:backend_tp_p2/features/reservas/domain/entities/mesa.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AvailableTablesState {}

class AvailableTablesUninitialized extends AvailableTablesState {}

class AvailableTablesLoadInProgress extends AvailableTablesState {}

class AvailableTablesLoadSuccess extends AvailableTablesState {
  final List<Mesa> tables;

  AvailableTablesLoadSuccess copyWith({List<Mesa> restaurants}) {
    return AvailableTablesLoadSuccess(tables: tables ?? this.tables);
  }

  AvailableTablesLoadSuccess({@required this.tables});
}

class AvailableTablesLoadError extends AvailableTablesState {
  final String message;

  AvailableTablesLoadError({@required this.message});

  @override
  String toString() => 'AvailableTablesLoadError { error: $message }';
}
