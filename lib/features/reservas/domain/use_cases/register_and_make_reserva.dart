import 'package:backend_tp_p2/features/reservas/data/models/reserva_model.dart';
import 'package:equatable/equatable.dart';

import '../repositories/reservas_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:meta/meta.dart';

class RegisterAndMakeReserva
    extends UseCase<ReservaModel, RegisterAndMakeReservaParams> {
  final ReservasRepository repository;

  RegisterAndMakeReserva(this.repository);

  @override
  Future<Either<Failure, ReservaModel>> call(
      RegisterAndMakeReservaParams params) async {
    return await repository.registerAndMakeReserva(
        reservaModel: params.reservaModel,
        nombre: params.nombre,
        apellido: params.apellido,
        ci: params.ci);
  }
}

class RegisterAndMakeReservaParams extends Equatable {
  final ReservaModel reservaModel;
  final String nombre;
  final String apellido;
  final String ci;

  RegisterAndMakeReservaParams(
      {@required this.reservaModel,
      @required this.nombre,
      @required this.apellido,
      @required this.ci});

  @override
  List<Object> get props => [reservaModel, nombre, apellido, ci];
}
