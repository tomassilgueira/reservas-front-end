import 'package:backend_tp_p2/core/error/exception.dart';
import 'package:backend_tp_p2/core/error/failure.dart';
import 'package:backend_tp_p2/core/network/network_info.dart';
import 'package:backend_tp_p2/features/reservas/data/data_sources/reservas_remote_data_source.dart';
import 'package:backend_tp_p2/features/reservas/data/models/reserva_model.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/cliente.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/mesa.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/reserva.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/restaurant.dart';
import 'package:backend_tp_p2/features/reservas/domain/repositories/reservas_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class ReservasRepositoryImpl implements ReservasRepository {
  final ReservasRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ReservasRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, List<Restaurant>>> getRestaurants() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getRestaurants());
      } on ServerException catch (exception) {
        return Left(ServerFailure(
          code: exception.code,
        ));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Mesa>>> getAvailableTables(
      {@required String restauranteId,
      @required List<String> rangos,
      @required DateTime fecha}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getAvailableTables(
            restauranteId: restauranteId, rangos: rangos, fecha: fecha));
      } on ServerException catch (exception) {
        return Left(ServerFailure(
          code: exception.code,
        ));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, ReservaModel>> makeReserva(
      {ReservaModel reservaModel}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(
            await remoteDataSource.makeReserva(reservaModel: reservaModel));
      } on ServerException catch (exception) {
        return Left(ServerFailure(
          code: exception.code,
        ));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, ReservaModel>> registerAndMakeReserva(
      {ReservaModel reservaModel,
      String nombre,
      String apellido,
      String ci}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.registerAndMakeReserva(
            reservaModel: reservaModel,
            nombre: nombre,
            apellido: apellido,
            ci: ci));
      } on ServerException catch (exception) {
        return Left(ServerFailure(
          code: exception.code,
        ));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Cliente>>> getClientes() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getClientes());
      } on ServerException catch (exception) {
        return Left(ServerFailure(
          code: exception.code,
        ));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Reserva>>> getReservas(
      {String restauranteId, String clienteId, DateTime fecha}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getReservas(
            restauranteId: restauranteId, clienteId: clienteId, fecha: fecha));
      } on ServerException catch (exception) {
        return Left(ServerFailure(
          code: exception.code,
        ));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
