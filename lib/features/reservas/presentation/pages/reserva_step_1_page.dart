import 'package:backend_tp_p2/features/reservas/presentation/bloc/bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/widgets/reserva_step_1_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../../../injection_container.dart';

class ReservaStep1Page extends StatefulWidget {
  @override
  _ReservaStep1PageState createState() => _ReservaStep1PageState();
}

class _ReservaStep1PageState extends State<ReservaStep1Page> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RestaurantsBloc>.value(
        value: sl<RestaurantsBloc>()..add(RestaurantsLoadStarted()),
        child: ReservaStep1Content(),
    );
  }
}
