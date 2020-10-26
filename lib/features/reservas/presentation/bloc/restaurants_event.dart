import 'package:equatable/equatable.dart';

abstract class RestaurantsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RestaurantsLoadStarted extends RestaurantsEvent {}
