import 'package:backend_tp_p2/features/reservas/presentation/bloc/available_tables_bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/available_tables_event.dart';
import 'package:backend_tp_p2/features/reservas/presentation/widgets/reserva_step_2_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../injection_container.dart';

class ReservaStep2Page extends StatefulWidget {
  final String selectedRestaurant;
  final List<String> timeRanges;
  final DateTime selectedDate;
  ReservaStep2Page(
      {Key key,
      @required this.selectedRestaurant,
      @required this.timeRanges,
      @required this.selectedDate})
      : super(key: key);

  @override
  _ReservaStep2PageState createState() => _ReservaStep2PageState();
}

class _ReservaStep2PageState extends State<ReservaStep2Page> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AvailableTablesBloc>.value(
      value: sl<AvailableTablesBloc>()
        ..add(AvailableTablesLoadStarted(
            restauranteId: widget.selectedRestaurant,
            rangos: widget.timeRanges,
            fecha: widget.selectedDate)),
      child: ReservaStep2Content(
        selectedRestaurant: widget.selectedRestaurant,
        selectedDate: widget.selectedDate,
        timeRanges: widget.timeRanges,
      ),
    );
  }
}
