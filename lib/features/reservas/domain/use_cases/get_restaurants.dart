import '../repositories/reservas_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/restaurant.dart';

class GetRestaurants extends UseCase<List<Restaurant>, NoParams> {
  final ReservasRepository repository;

  GetRestaurants(this.repository);

  @override
  Future<Either<Failure, List<Restaurant>>> call(NoParams params) async {
    return await repository.getRestaurants();
  }
}
