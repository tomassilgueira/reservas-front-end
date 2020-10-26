import 'dart:async';

import 'package:backend_tp_p2/core/error/exception.dart';
import 'package:backend_tp_p2/core/network/network_service.dart';
import 'package:backend_tp_p2/features/reservas/data/models/cliente_model.dart';
import 'package:backend_tp_p2/features/reservas/data/models/mesa_model.dart';
import 'package:backend_tp_p2/features/reservas/data/models/reserva_model.dart';
import 'package:backend_tp_p2/features/reservas/data/models/restaurant_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

abstract class ReservasRemoteDataSource {
  Future<List<RestaurantModel>> getRestaurants();
  Future<List<MesaModel>> getAvailableTables(
      {@required String restauranteId,
      @required List<String> rangos,
      @required DateTime fecha});
  Future<ReservaModel> makeReserva({@required ReservaModel reservaModel});
  Future<ReservaModel> registerAndMakeReserva(
      {@required ReservaModel reservaModel,
      @required String nombre,
      @required String apellido,
      @required String ci});
  Future<List<ReservaModel>> getReservas(
      {@required String restauranteId,
      @required String clienteId,
      @required DateTime fecha});
  Future<List<ClienteModel>> getClientes();
}

class ReservasRemoteDataSourceImpl implements ReservasRemoteDataSource {
  final NetworkService client;

  ReservasRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<RestaurantModel>> getRestaurants() async {
    try {
      final response = await client.get("restaurantes");
      List<RestaurantModel> restaurants = response.data
          .map<RestaurantModel>((jsonNew) => RestaurantModel.fromJson(jsonNew))
          .toList();
      return restaurants;
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.RESPONSE) {
        throw ServerException(
          code: dioError.response.statusCode,
        );
      } else
        throw NetworkException();
    }
  }

  @override
  Future<List<MesaModel>> getAvailableTables(
      {@required String restauranteId,
      @required List<String> rangos,
      @required DateTime fecha}) async {
    try {
      String dateStr = json.encode(fecha.toIso8601String());
      final response = await client.get(
          "mesas/disponibles/?restauranteId=$restauranteId&rangos=${rangos.toString()}&fecha=${dateStr.replaceAll('\"', '')}");
      List<MesaModel> tables = response.data
          .map<MesaModel>((jsonNew) => MesaModel.fromJson(jsonNew))
          .toList();
      return tables;
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.RESPONSE) {
        throw ServerException(
          code: dioError.response.statusCode,
        );
      } else
        throw NetworkException();
    }
  }

  @override
  Future<ReservaModel> makeReserva({ReservaModel reservaModel}) async {
    try {
      final data = reservaModel.toJson();
      final response = await client.post("reservas", data: data);
      return reservaModel;
    } on DioError catch (dioError) {
      if (dioError.response.statusCode == 400) {
        return null;
      }
      if (dioError.type == DioErrorType.RESPONSE) {
        throw ServerException(
          code: dioError.response.statusCode,
        );
      } else
        throw NetworkException();
    }
  }

  @override
  Future<ReservaModel> registerAndMakeReserva(
      {ReservaModel reservaModel,
      String nombre,
      String apellido,
      String ci}) async {
    try {
      var response = await client.post("clientes",
          data: {"nombre": nombre, "apellido": apellido, "ci": ci});
      final data = reservaModel.toJson();
      response = await client.post("reservas", data: data);
      return reservaModel;
    } on DioError catch (dioError) {
      if (dioError.response.statusCode == 400) {
        return null;
      }
      if (dioError.type == DioErrorType.RESPONSE) {
        throw ServerException(
          code: dioError.response.statusCode,
        );
      } else
        throw NetworkException();
    }
  }

  @override
  Future<List<ReservaModel>> getReservas({@required String restauranteId,
    @required String clienteId,
    @required DateTime fecha}) async {
    try {
      String dateStr = json.encode(fecha.toIso8601String());
      String clienteStr = '';
      if(clienteId!=null)
        clienteStr = '&clienteId=$clienteId';
      final response = await client.get("reservas/?fecha=${dateStr.replaceAll('\"', '')}&restauranteId=$restauranteId" + clienteStr);
      List<ReservaModel> reservas = response.data
          .map<ReservaModel>((jsonNew) => ReservaModel.fromJson(jsonNew))
          .toList();
      return reservas;
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.RESPONSE) {
        throw ServerException(
          code: dioError.response.statusCode,
        );
      } else
        throw NetworkException();
    }
  }

  @override
  Future<List<ClienteModel>> getClientes() async {
    try {
      final response = await client.get("clientes");
      List<ClienteModel> clientes = response.data
          .map<ClienteModel>((jsonNew) => ClienteModel.fromJson(jsonNew))
          .toList();
      return clientes;
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.RESPONSE) {
        throw ServerException(
          code: dioError.response.statusCode,
        );
      } else
        throw NetworkException();
    }
  }
}
