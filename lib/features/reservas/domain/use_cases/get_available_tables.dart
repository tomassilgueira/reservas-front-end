import '../repositories/reservas_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/mesa.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetAvailableTables extends UseCase<List<Mesa>, GetAvailableTablesParams> {
  final ReservasRepository repository;

  GetAvailableTables(this.repository);

  @override
  Future<Either<Failure, List<Mesa>>> call(
      GetAvailableTablesParams params) async {
    return await repository.getAvailableTables(
        restauranteId: params.restauranteId,
        rangos: params.rangos,
        fecha: params.fecha);
  }
}

class GetAvailableTablesParams extends Equatable {
  final String restauranteId;
  final List<String> rangos;
  final DateTime fecha;

  GetAvailableTablesParams(
      {@required this.restauranteId,
      @required this.rangos,
      @required this.fecha});

  @override
  List<Object> get props => [restauranteId, rangos, fecha];
}
