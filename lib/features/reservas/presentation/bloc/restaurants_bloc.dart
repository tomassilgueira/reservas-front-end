import 'dart:async';

import 'package:backend_tp_p2/core/error/failure.dart';
import 'package:backend_tp_p2/core/usecases/usecase.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/restaurant.dart';
import 'package:backend_tp_p2/features/reservas/domain/use_cases/get_restaurants.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'restaurants_event.dart';
import 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  final GetRestaurants getRestaurants;

  RestaurantsBloc({
    @required GetRestaurants getRestaurants,
  })  : getRestaurants = getRestaurants,
        super(RestaurantsUninitialized());

  Stream<RestaurantsState> _eitherLoadedOrErrorState(
      Either<Failure, List<Restaurant>> failureOrRestaurant) async* {
    yield failureOrRestaurant.fold(
      (failure) {
        //print('RestaurantsLoadError');
        return RestaurantsLoadError(
        message: mapFailureToMessage(failure),
      );
      },
      (restaurants) {
        //print('RestaurantsLoadSuccess');
        return RestaurantsLoadSuccess(restaurants: restaurants);
      },
    );
  }

  @override
  Stream<RestaurantsState> mapEventToState(
    RestaurantsEvent event,
  ) async* {
    if (event is RestaurantsLoadStarted) {
      //print('RestaurantsLoadInProgress');
      yield RestaurantsLoadInProgress();
      final failureOrRestaurants = await getRestaurants(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrRestaurants);
    }
  }
}
