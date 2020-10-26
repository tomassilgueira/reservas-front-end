import 'package:backend_tp_p2/features/reservas/data/models/reserva_model.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/reserva_bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/reserva_event.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/reserva_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../injection_container.dart';

class ReservaStep3Content extends StatefulWidget {
  final ReservaModel reservaModel;
  ReservaStep3Content({Key key, @required this.reservaModel}) : super(key: key);

  @override
  _ReservaStep3ContentState createState() => _ReservaStep3ContentState();
}

class _ReservaStep3ContentState extends State<ReservaStep3Content> {
  final nameInputController = TextEditingController();
  final lastNameInputController = TextEditingController();

  @override
  void dispose() {
    nameInputController.dispose();
    lastNameInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservar Mesa'),
      ),
      body: BlocConsumer<ReservaBloc, ReservaState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ReservaSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    'Reserva registrada con éxito',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Icon(
                    Icons.check_circle_outline,
                    size: 200,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "IR AL INICIO",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ClientNotRegistered) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'La cédula no pertenece a ningún cliente, favor registrarlo para proceder a realizar la reserva',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        filled: true,
                        labelText: "Nombre",
                        hintText: "Ingrese su nombre",
                      ),
                      controller: nameInputController,
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        filled: true,
                        labelText: "Apellido",
                        hintText: "Ingrese su apellido",
                      ),
                      controller: lastNameInputController,
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: RaisedButton(
                          onPressed: () {
                            sl<ReservaBloc>()
                              ..add(RegisterAndReservaRequested(
                                  reservaModel: widget.reservaModel,
                                  nombre: nameInputController.value.text,
                                  apellido: lastNameInputController.value.text,
                                  ci: widget.reservaModel.ci));
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
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
              ],
            ),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
