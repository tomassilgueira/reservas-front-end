import 'package:backend_tp_p2/features/reservas/domain/entities/cliente.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ClientesState {}

class ClientesUninitialized extends ClientesState {}

class ClientesLoadInProgress extends ClientesState {}

class ClientesLoadSuccess extends ClientesState {
  final List<Cliente> clientes;

  ClientesLoadSuccess copyWith({List<Cliente> clientes}) {
    return ClientesLoadSuccess(clientes: clientes ?? this.clientes);
  }

  ClientesLoadSuccess({@required this.clientes});
}

class ClientesLoadError extends ClientesState {
  final String message;

  ClientesLoadError({@required this.message});

  @override
  String toString() => 'RestaurantsLoadError { error: $message }';
}
