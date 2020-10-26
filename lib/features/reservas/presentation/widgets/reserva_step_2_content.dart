import 'package:backend_tp_p2/features/reservas/data/models/reserva_model.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/mesa.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/available_tables_bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/available_tables_state.dart';
import 'package:backend_tp_p2/features/reservas/presentation/pages/reserva_step_3_page.dart';
import 'package:backend_tp_p2/features/reservas/presentation/widgets/table_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ReservaStep2Content extends StatefulWidget {
  final String selectedRestaurant;
  final List<String> timeRanges;
  final DateTime selectedDate;
  ReservaStep2Content(
      {Key key,
      @required this.selectedRestaurant,
      @required this.timeRanges,
      @required this.selectedDate})
      : super(key: key);

  @override
  _ReservaStep2ContentState createState() => _ReservaStep2ContentState();
}

class _ReservaStep2ContentState extends State<ReservaStep2Content> {
  String _selectedMesaId;

  final ciController = TextEditingController();

  @override
  void dispose() {
    ciController.dispose();
    super.dispose();
  }

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
          title: Text('Reservar Mesa'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocConsumer<AvailableTablesBloc, AvailableTablesState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    List<Mesa> availableTables = [];
                    if (state is AvailableTablesLoadSuccess) {
                      availableTables = state.tables;
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 16),
                        Text(
                          'Seleccione una mesa',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              availableTables.length,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedMesaId =
                                          availableTables[index].id;
                                    });
                                  },
                                  child: TableCard(
                                      mesa: availableTables[index],
                                      color: _selectedMesaId ==
                                              availableTables[index].id
                                          ? Colors.greenAccent
                                          : Colors.white),
                                ),
                              )),
                        ),
                        SizedBox(height: 40),
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            filled: true,
                            labelText: "Cédula",
                            hintText: "Ingrese su cédula de identidad",
                          ),
                          keyboardType: TextInputType.number,
                          controller: ciController,
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: RaisedButton(
                            onPressed: _selectedMesaId == null ||
                                    ciController.value.text == ''
                                ? null
                                : () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ReservaStep3Page(
                                            reservaModel: ReservaModel(
                                              mesaId: _selectedMesaId,
                                              ci: ciController.value.text,
                                              fecha: widget.selectedDate,
                                              rangos: widget.timeRanges
                                            ),
                                          )),
                                    );
                                  },
                            child: Text(
                              "CONFIRMAR",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
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
