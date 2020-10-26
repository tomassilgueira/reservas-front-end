import 'dart:async';

import 'package:backend_tp_p2/core/error/failure.dart';
import 'package:backend_tp_p2/core/usecases/usecase.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/cliente.dart';
import 'package:backend_tp_p2/features/reservas/domain/use_cases/get_clientes.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'clientes_event.dart';
import 'clientes_state.dart';

class ClientesBloc extends Bloc<ClientesEvent, ClientesState> {
  final GetClientes getClientes;

  ClientesBloc({
    @required GetClientes getClientes,
  })  : getClientes = getClientes,
        super(ClientesUninitialized());

  Stream<ClientesState> _eitherLoadedOrErrorState(
      Either<Failure, List<Cliente>> failureOrClientes) async* {
    yield failureOrClientes.fold(
      (failure) {
        //print('RestaurantsLoadError');
        return ClientesLoadError(
        message: mapFailureToMessage(failure),
      );
      },
      (clientes) {
        //print('RestaurantsLoadSuccess');
        return ClientesLoadSuccess(clientes: clientes);
      },
    );
  }

  @override
  Stream<ClientesState> mapEventToState(
      ClientesEvent event,
  ) async* {
    if (event is ClientesLoadStarted) {
      //print('RestaurantsLoadInProgress');
      yield ClientesLoadInProgress();
      final failureOrClientes = await getClientes(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrClientes);
    }
  }
}
