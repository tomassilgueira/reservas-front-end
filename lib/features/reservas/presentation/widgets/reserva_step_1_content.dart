import 'package:backend_tp_p2/features/reservas/domain/entities/restaurant.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/pages/reserva_step_2_page.dart';
import 'package:backend_tp_p2/features/reservas/presentation/widgets/textfieldDatePicker.dart';
import 'package:backend_tp_p2/features/reservas/presentation/widgets/time_range_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ReservaStep1Content extends StatefulWidget {
  ReservaStep1Content({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ReservaStep1ContentState createState() => _ReservaStep1ContentState();
}

class _ReservaStep1ContentState extends State<ReservaStep1Content> {
  List<Map<String, dynamic>> rangesList = [
    {
      'rangeString': '12:00 a 13:00',
      'key': '12 a 13',
      'value': false,
    },
    {
      'rangeString': '13:00 a 14:00',
      'key': '13 a 14',
      'value': false,
    },
    {
      'rangeString': '14:00 a 15:00',
      'key': '14 a 15',
      'value': false,
    },
    {
      'rangeString': '15:00 a 16:00',
      'key': '15 a 16',
      'value': false,
    },
    {
      'rangeString': '16:00 a 17:00',
      'key': '16 a 17',
      'value': false,
    },
    {
      'rangeString': '17:00 a 18:00',
      'key': '17 a 18',
      'value': false,
    },
    {
      'rangeString': '18:00 a 19:00',
      'key': '18 a 19',
      'value': false,
    },
  ];

  String _selectedRestaurant;
  List<DropdownMenuItem<String>> _dropdownMenuItems = [];
  DateTime _selectedDate = DateTime.now();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservar Mesa'),
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
                'Horas',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          rangesList[0]['value'] = !rangesList[0]['value'];
                        });
                      },
                      child: TimeRangeCard(
                        rangeString: rangesList[0]['rangeString'],
                        color: rangesList[0]['value']
                            ? Colors.greenAccent
                            : Colors.white,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          rangesList[1]['value'] = !rangesList[1]['value'];
                        });
                      },
                      child: TimeRangeCard(
                        rangeString: rangesList[1]['rangeString'],
                        color: rangesList[1]['value']
                            ? Colors.greenAccent
                            : Colors.white,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          rangesList[2]['value'] = !rangesList[2]['value'];
                        });
                      },
                      child: TimeRangeCard(
                        rangeString: rangesList[2]['rangeString'],
                        color: rangesList[2]['value']
                            ? Colors.greenAccent
                            : Colors.white,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          rangesList[3]['value'] = !rangesList[3]['value'];
                        });
                      },
                      child: TimeRangeCard(
                        rangeString: rangesList[3]['rangeString'],
                        color: rangesList[3]['value']
                            ? Colors.greenAccent
                            : Colors.white,
                      )),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          rangesList[4]['value'] = !rangesList[4]['value'];
                        });
                      },
                      child: TimeRangeCard(
                        rangeString: rangesList[4]['rangeString'],
                        color: rangesList[4]['value']
                            ? Colors.greenAccent
                            : Colors.white,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          rangesList[5]['value'] = !rangesList[5]['value'];
                        });
                      },
                      child: TimeRangeCard(
                        rangeString: rangesList[5]['rangeString'],
                        color: rangesList[5]['value']
                            ? Colors.greenAccent
                            : Colors.white,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          rangesList[6]['value'] = !rangesList[6]['value'];
                        });
                      },
                      child: TimeRangeCard(
                        rangeString: rangesList[6]['rangeString'],
                        color: rangesList[6]['value']
                            ? Colors.greenAccent
                            : Colors.white,
                      )),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: RaisedButton(
                    onPressed: _selectedRestaurant != null &&
                            rangesList
                                .where((element) => element['value'] == true)
                                .isNotEmpty
                        ? () {
                            List<String> selectedRanges = [];
                            for (Map<String, dynamic> map in rangesList
                                .where((element) => element['value'] == true)) {
                              selectedRanges.add(map['key']);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReservaStep2Page(
                                        selectedRestaurant: _selectedRestaurant,
                                        selectedDate: _selectedDate,
                                        timeRanges: selectedRanges,
                                      )),
                            );
                          }
                        : null,
                    child: Text(
                      "CONTINUAR",
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
