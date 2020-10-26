import 'package:backend_tp_p2/features/reservas/data/models/reserva_model.dart';
import 'package:equatable/equatable.dart';

import '../repositories/reservas_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:meta/meta.dart';

class MakeReserva extends UseCase<ReservaModel, MakeReservaParams> {
  final ReservasRepository repository;

  MakeReserva(this.repository);

  @override
  Future<Either<Failure, ReservaModel>> call(MakeReservaParams params) async {
    return await repository.makeReserva(reservaModel: params.reservaModel);
  }
}
class MakeReservaParams extends Equatable {
  final ReservaModel reservaModel;


  MakeReservaParams(
      {@required this.reservaModel});

  @override
  List<Object> get props => [reservaModel];
}
