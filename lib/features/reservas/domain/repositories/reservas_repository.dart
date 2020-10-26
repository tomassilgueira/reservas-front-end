import 'package:backend_tp_p2/features/reservas/data/models/reserva_model.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/cliente.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/reserva.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/restaurant.dart';
import '../entities/mesa.dart';
import 'package:meta/meta.dart';

abstract class ReservasRepository {
  Future<Either<Failure, List<Restaurant>>> getRestaurants();
  Future<Either<Failure, List<Mesa>>> getAvailableTables(
      {@required String restauranteId,
      @required List<String> rangos,
      @required DateTime fecha});
  Future<Either<Failure, ReservaModel>> makeReserva(
      {@required ReservaModel reservaModel});
  Future<Either<Failure, ReservaModel>> registerAndMakeReserva(
      {@required ReservaModel reservaModel,
      @required String nombre,
      @required String apellido,
      @required String ci});
  Future<Either<Failure, List<Cliente>>> getClientes();
  Future<Either<Failure, List<Reserva>>> getReservas(
      {@required String restauranteId,
        @required String clienteId,
        @required DateTime fecha});
}
