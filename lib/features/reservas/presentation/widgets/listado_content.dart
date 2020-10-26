import 'package:backend_tp_p2/features/reservas/domain/entities/cliente.dart';
import 'package:backend_tp_p2/features/reservas/domain/entities/restaurant.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/pages/filtrado_page.dart';
import 'package:backend_tp_p2/features/reservas/presentation/pages/reserva_step_2_page.dart';
import 'package:backend_tp_p2/features/reservas/presentation/widgets/textfieldDatePicker.dart';
import 'package:backend_tp_p2/features/reservas/presentation/widgets/time_range_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ListadoContent extends StatefulWidget {
  ListadoContent({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ListadoContentState createState() => _ListadoContentState();
}

class _ListadoContentState extends State<ListadoContent> {
  String _selectedRestaurant;
  String _selectedClient;
  List<DropdownMenuItem<String>> _dropdownMenuItems = [];
  DateTime _selectedDate = DateTime.now();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Reservas'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16),
              Text(
                'Restaurante',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              BlocConsumer<RestaurantsBloc, RestaurantsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is RestaurantsLoadSuccess) {
                    _dropdownMenuItems = [];
                    for (Restaurant restaurant in state.restaurants) {
                      _dropdownMenuItems.add(DropdownMenuItem<String>(
                        child: Text(restaurant.nombre),
                        value: restaurant.id,
                      ));
                    }
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(width: 2, color: Colors.blueGrey)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: Text('Seleccionar'),
                          value: _selectedRestaurant,
                          items: _dropdownMenuItems,
                          onChanged: (value) {
                            setState(() {
                              _selectedRestaurant = value;
                            });
                          }),
                    ),
                  );
                },
              ),
              SizedBox(height: 8),
              Text(
                'Fecha',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              MyTextFieldDatePicker(
                labelText: "Date",
                prefixIcon: Icon(Icons.date_range),
                suffixIcon: Icon(Icons.arrow_drop_down),
                lastDate: DateTime.now().add(Duration(days: 366)),
                firstDate: DateTime.now(),
                initialDate: DateTime.now(),
                onDateChanged: (selectedDate) {
                  setState(() {
                    _selectedDate = selectedDate;
                  });
                  // Do something with the selected date
                },
              ),
              SizedBox(height: 8),
              Text(
                'Cliente',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              BlocConsumer<ClientesBloc, ClientesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ClientesLoadSuccess) {
                    _dropdownMenuItems = [];
                    for (Cliente cliente in state.clientes) {
                      _dropdownMenuItems.add(DropdownMenuItem<String>(
                        child: Text(cliente.nombre + ' ' + cliente.apellido),
                        value: cliente.id,
                      ));
                    }
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(width: 2, color: Colors.blueGrey)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: Text('Seleccionar'),
                          value: _selectedClient,
                          items: _dropdownMenuItems,
                          onChanged: (value) {
                            setState(() {
                              _selectedClient = value;
                            });
                          }),
                    ),
                  );
                },
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: RaisedButton(
                    onPressed: _selectedRestaurant == null ||
                            _selectedDate == null
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FiltradoPage(
                                        selectedRestaurant: _selectedRestaurant,
                                        selectedClient: _selectedClient,
                                        selectedDate: _selectedDate,
                                      )),
                            );
                          },
                    child: Text(
                      "FILTRAR",
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
