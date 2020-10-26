import 'package:backend_tp_p2/features/reservas/presentation/bloc/bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/widgets/listado_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../../../injection_container.dart';

class ListadoPage extends StatefulWidget {
  @override
  _ListadoPageState createState() => _ListadoPageState();
}

class _ListadoPageState extends State<ListadoPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantsBloc>.value(
          value: sl<RestaurantsBloc>()..add(RestaurantsLoadStarted()),
        ),
        BlocProvider<ClientesBloc>.value(
          value: sl<ClientesBloc>()..add(ClientesLoadStarted()),
        )
      ],
      child: ListadoContent(),
    );
  }
}
