import 'package:backend_tp_p2/core/error/messages.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Failure extends Equatable {
  Failure([properties = const <dynamic>[]]);

  @override
  List<Object> get props => [null];
}

class ServerFailure extends Failure {
  final String message;
  final int code;
  ServerFailure({this.message, @required this.code}) : super([message]);
}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class UnknownFailure extends Failure {}

String mapFailureToMessage(failure) {
  switch (failure.runtimeType) {
    case NetworkFailure:
      return NETWORK_FAILURE_MESSAGE;
    case ServerFailure:
      return failure.message != null ? failure.message : SERVER_FAILURE_MESSAGE;
    default:
      return UNEXPECTED_ERROR_MESSAGE;
  }
}
