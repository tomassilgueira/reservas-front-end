import 'package:backend_tp_p2/features/reservas/domain/entities/reserva.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservaCard extends StatelessWidget {
  final Reserva reserva;
  const ReservaCard({Key key, @required this.reserva})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reserva.mesa.nombre,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      DateFormat('dd-MM-yyyy').format(reserva.fecha),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cliente ${reserva.clienteId}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Horario: ${reserva.rangos.toString().replaceAll('[', '').replaceAll(']', '')}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Restaurante ${reserva.mesa.restaurantId}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      reserva.mesa.planta == 1 ? 'Planta Baja' : 'Piso ${reserva.mesa.planta}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(reserva.mesa.capacidad,
                      (index) => Icon(Icons.person_rounded, size: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
