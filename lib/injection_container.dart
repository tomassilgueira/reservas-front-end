import 'package:backend_tp_p2/core/network/network_info.dart';
import 'package:backend_tp_p2/core/network/network_service.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:backend_tp_p2/features/reservas/injection_container.dart'
as ReservasInjectionContainer;


final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => DioClient().dioInstance);
  sl.registerLazySingleton<NetworkService>(
      () => NetworkService(dioInstance: sl()));
  sl.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());

  ReservasInjectionContainer.init();

}
