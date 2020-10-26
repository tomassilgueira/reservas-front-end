import 'package:backend_tp_p2/features/reservas/domain/entities/restaurant.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RestaurantsState {}

class RestaurantsUninitialized extends RestaurantsState {}

class RestaurantsLoadInProgress extends RestaurantsState {}

class RestaurantsLoadSuccess extends RestaurantsState {
  final List<Restaurant> restaurants;

  RestaurantsLoadSuccess copyWith({List<Restaurant> restaurants}) {
    return RestaurantsLoadSuccess(restaurants: restaurants ?? this.restaurants);
  }

  RestaurantsLoadSuccess({@required this.restaurants});
}

class RestaurantsLoadError extends RestaurantsState {
  final String message;

  RestaurantsLoadError({@required this.message});

  @override
  String toString() => 'RestaurantsLoadError { error: $message }';
}
