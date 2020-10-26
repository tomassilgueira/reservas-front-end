import 'package:backend_tp_p2/features/reservas/presentation/bloc/bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/widgets/filtrado_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../injection_container.dart';

class FiltradoPage extends StatefulWidget {
  final String selectedRestaurant;
  final String selectedClient;
  final DateTime selectedDate;
  FiltradoPage(
      {Key key,
      @required this.selectedRestaurant,
      @required this.selectedClient,
      @required this.selectedDate})
      : super(key: key);

  @override
  _FiltradoPageState createState() => _FiltradoPageState();
}

class _FiltradoPageState extends State<FiltradoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilteredReservasBloc>.value(
      value: sl<FilteredReservasBloc>()
        ..add(FilteredReservasLoadStarted(
            restauranteId: widget.selectedRestaurant,
            clienteId: widget.selectedClient,
            fecha: widget.selectedDate)),
      child: FiltradoContent(
        selectedRestaurant: widget.selectedRestaurant,
        selectedDate: widget.selectedDate,
        selectedCliente: widget.selectedClient,
      ),
    );
  }
}
