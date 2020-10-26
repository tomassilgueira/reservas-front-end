import 'package:backend_tp_p2/features/reservas/data/models/reserva_model.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/mesa.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/reserva.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/available_tables_bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/available_tables_state.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/filtered_reservas_bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/filtered_reservas_state.dart';
import 'package:backend_tp_p2/features/reservas/presentation/pages/reserva_step_3_page.dart';
import 'package:backend_tp_p2/features/reservas/presentation/widgets/reserva_card.dart';
import 'package:backend_tp_p2/features/reservas/presentation/widgets/table_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class FiltradoContent extends StatefulWidget {
  final String selectedRestaurant;
  final String selectedCliente;
  final DateTime selectedDate;
  FiltradoContent(
      {Key key,
      @required this.selectedRestaurant,
      @required this.selectedCliente,
      @required this.selectedDate})
      : super(key: key);

  @override
  _FiltradoContentState createState() => _FiltradoContentState();
}

class _FiltradoContentState extends State<FiltradoContent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.children != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Listado de Reservas'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocConsumer<FilteredReservasBloc, FilteredReservasState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    List<Reserva> reservas = [];
                    if (state is FilteredReservasLoadSuccess) {
                      reservas = state.reservas;
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              reservas.length,
                              (index) => ReservaCard(
                                    reserva: reservas[index],
                                  )),
                        ),
                        SizedBox(height: 40),
                      ],
                    );
                  }),
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
