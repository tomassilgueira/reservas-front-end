import 'dart:async';

import 'package:backend_tp_p2/core/error/failure.dart';
import 'package:backend_tp_p2/features/reservas/data/models/reserva_model.dart';
import 'package:backend_tp_p2/features/reservas/domain/use_cases/make_reserva.dart';
import 'package:backend_tp_p2/features/reservas/domain/use_cases/register_and_make_reserva.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'reserva_event.dart';
import 'reserva_state.dart';

class ReservaBloc extends Bloc<ReservaEvent, ReservaState> {
  final MakeReserva makeReserva;
  final RegisterAndMakeReserva registerAndMakeReserva;

  ReservaBloc({
    @required MakeReserva makeReserva,
    @required RegisterAndMakeReserva registerAndMakeReserva,
  })  : makeReserva = makeReserva,
        registerAndMakeReserva = registerAndMakeReserva,
        super(ReservaInitial());

  Stream<ReservaState> _eitherLoadedOrErrorState(
      Either<Failure, ReservaModel> failureOrReserva) async* {
    yield failureOrReserva.fold(
      (failure) {
        print('ReservaFailure');
        return ReservaFailure(
          message: mapFailureToMessage(failure),
        );
      },
      (reserva) {
        if (reserva == null) {
          print('ClientNotRegistered');
          return ClientNotRegistered();
        } else {
          print('ReservaSuccess');
          return ReservaSuccess(reservaModel: reserva);
        }
      },
    );
  }

  @override
  Stream<ReservaState> mapEventToState(
    ReservaEvent event,
  ) async* {
    if (event is ReservaRequested) {
      print('ReservaInProgress');
      yield ReservaInProgress();
      final failureOrReserva = await makeReserva(
          MakeReservaParams(reservaModel: event.reservaModel));
      yield* _eitherLoadedOrErrorState(failureOrReserva);
    } else if (event is RegisterAndReservaRequested) {
      print('ReservaInProgress');
      yield ReservaInProgress();
      final failureOrReserva = await registerAndMakeReserva(
          RegisterAndMakeReservaParams(
              reservaModel: event.reservaModel,
              nombre: event.nombre,
              apellido: event.apellido,
              ci: event.ci));
      yield* _eitherLoadedOrErrorState(failureOrReserva);
    }
  }
}
