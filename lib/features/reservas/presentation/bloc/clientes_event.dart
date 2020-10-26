import 'package:equatable/equatable.dart';

abstract class ClientesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ClientesLoadStarted extends ClientesEvent {}
