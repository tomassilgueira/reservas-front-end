import 'package:backend_tp_p2/features/reservas/domain/entities/cliente.dart';

import '../repositories/reservas_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class GetClientes extends UseCase<List<Cliente>, NoParams> {
  final ReservasRepository repository;

  GetClientes(this.repository);

  @override
  Future<Either<Failure, List<Cliente>>> call(NoParams params) async {
    return await repository.getClientes();
  }
}
