import 'dart:async';

import 'package:backend_tp_p2/core/error/failure.dart';
import 'package:backend_tp_p2/core/usecases/usecase.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/mesa.dart';
import 'package:backend_tp_p2/features/reservas/domain/use_cases/get_available_tables.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'available_tables_event.dart';
import 'available_tables_state.dart';

class AvailableTablesBloc
    extends Bloc<AvailableTablesEvent, AvailableTablesState> {
  final GetAvailableTables getAvailableTables;

  AvailableTablesBloc({
    @required GetAvailableTables getAvailableTables,
  })  : getAvailableTables = getAvailableTables,
        super(AvailableTablesUninitialized());

  Stream<AvailableTablesState> _eitherLoadedOrErrorState(
      Either<Failure, List<Mesa>> failureOrTables) async* {
    yield failureOrTables.fold(
      (failure) {
        print('AvailableTablesLoadError');
        return AvailableTablesLoadError(
          message: mapFailureToMessage(failure),
        );
      },
      (tables) {
        print('AvailableTablesLoadSuccess');
        return AvailableTablesLoadSuccess(tables: tables);
      },
    );
  }

  @override
  Stream<AvailableTablesState> mapEventToState(
    AvailableTablesEvent event,
  ) async* {
    if (event is AvailableTablesLoadStarted) {
      print('AvailableTablesLoadInProgress');
      yield AvailableTablesLoadInProgress();
      final failureOrTables = await getAvailableTables(GetAvailableTablesParams(
          restauranteId: event.restauranteId,
          rangos: event.rangos,
          fecha: event.fecha));
      yield* _eitherLoadedOrErrorState(failureOrTables);
    }
  }
}
