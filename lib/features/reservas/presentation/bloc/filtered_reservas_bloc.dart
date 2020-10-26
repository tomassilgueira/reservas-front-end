import 'dart:async';

import 'package:backend_tp_p2/core/error/failure.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/reserva.dart';
import 'package:backend_tp_p2/features/reservas/domain/use_cases/get_reservas.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'filtered_reservas_event.dart';
import 'filtered_reservas_state.dart';

class FilteredReservasBloc
    extends Bloc<FilteredReservasEvent, FilteredReservasState> {
  final GetReservas getReservas;

  FilteredReservasBloc({
    @required GetReservas getReservas,
  })  : getReservas = getReservas,
        super(FilteredReservasUninitialized());

  Stream<FilteredReservasState> _eitherLoadedOrErrorState(
      Either<Failure, List<Reserva>> failureOrReservas) async* {
    yield failureOrReservas.fold(
      (failure) {
        print('FilteredReservasLoadError');
        return FilteredReservasLoadError(
          message: mapFailureToMessage(failure),
        );
      },
      (reservas) {
        print('FilteredReservasLoadSuccess');
        return FilteredReservasLoadSuccess(reservas: reservas);
      },
    );
  }

  @override
  Stream<FilteredReservasState> mapEventToState(
      FilteredReservasEvent event,
  ) async* {
    if (event is FilteredReservasLoadStarted) {
      print('FilteredReservasLoadInProgress');
      yield FilteredReservasLoadInProgress();
      final failureOrReservas = await getReservas(GetReservasParams(
          restauranteId: event.restauranteId,
          clienteId: event.clienteId,
          fecha: event.fecha));
      yield* _eitherLoadedOrErrorState(failureOrReservas);
    }
  }
}
