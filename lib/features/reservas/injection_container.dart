import 'package:backend_tp_p2/features/reservas/data/data_sources/reservas_remote_data_source.dart';
import 'package:backend_tp_p2/features/reservas/data/repositories/reservas_repository_impl.dart';
import 'package:backend_tp_p2/features/reservas/domain/use_cases/get_available_tables.dart';
import 'package:backend_tp_p2/features/reservas/domain/use_cases/get_clientes.dart';
import 'package:backend_tp_p2/features/reservas/domain/use_cases/get_reservas.dart';
import 'package:backend_tp_p2/features/reservas/domain/use_cases/get_restaurants.dart';
import 'package:backend_tp_p2/features/reservas/domain/use_cases/make_reserva.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/restaurants_bloc.dart';
import 'package:backend_tp_p2/injection_container.dart';

import 'domain/repositories/reservas_repository.dart';
import 'domain/use_cases/register_and_make_reserva.dart';

void init() {
  sl.registerLazySingleton<RestaurantsBloc>(
      () => RestaurantsBloc(getRestaurants: sl()));
  sl.registerLazySingleton<AvailableTablesBloc>(
          () => AvailableTablesBloc(getAvailableTables: sl()));
  sl.registerLazySingleton<ReservaBloc>(
          () => ReservaBloc(makeReserva: sl(), registerAndMakeReserva: sl()));
  sl.registerLazySingleton<ClientesBloc>(
          () => ClientesBloc(getClientes: sl()));
  sl.registerLazySingleton<FilteredReservasBloc>(
          () => FilteredReservasBloc(getReservas: sl()));

  // Use cases
  sl.registerLazySingleton<GetRestaurants>(() => GetRestaurants(sl()));
  sl.registerLazySingleton<GetAvailableTables>(() => GetAvailableTables(sl()));
  sl.registerLazySingleton<MakeReserva>(() => MakeReserva(sl()));
  sl.registerLazySingleton<RegisterAndMakeReserva>(() => RegisterAndMakeReserva(sl()));
  sl.registerLazySingleton<GetClientes>(() => GetClientes(sl()));
  sl.registerLazySingleton<GetReservas>(() => GetReservas(sl()));


  //Repository
  sl.registerLazySingleton<ReservasRepository>(() => ReservasRepositoryImpl(
        networkInfo: sl(),
        remoteDataSource: sl(),
      ));

  //Data Sources
  sl.registerLazySingleton<ReservasRemoteDataSource>(
      () => ReservasRemoteDataSourceImpl(
            client: sl(),
          ));
}
