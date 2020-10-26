import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../repositories/reservas_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/reserva.dart';

class GetReservas extends UseCase<List<Reserva>, GetReservasParams> {
  final ReservasRepository repository;

  GetReservas(this.repository);

  @override
  Future<Either<Failure, List<Reserva>>> call(GetReservasParams params) async {
    return await repository.getReservas(
        restauranteId: params.restauranteId,
        clienteId: params.clienteId,
        fecha: params.fecha);
  }
}

class GetReservasParams extends Equatable {
  final String restauranteId;
  final String clienteId;
  final DateTime fecha;

  GetReservasParams(
      {@required this.restauranteId,
      @required this.clienteId,
      @required this.fecha});

  @override
  List<Object> get props => [restauranteId, clienteId, fecha];
}
