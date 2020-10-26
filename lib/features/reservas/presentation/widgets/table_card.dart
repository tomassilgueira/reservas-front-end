import 'package:flutter/material.dart';
import '../../domain/entities/mesa.dart';

class TableCard extends StatelessWidget {
  final Mesa mesa;
  final Color color;
  const TableCard({Key key, @required this.mesa, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card(
        color: color,
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
                Text(
                  mesa.nombre,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  mesa.planta == 1 ? 'Planta Baja' : 'Piso ${mesa.planta}',
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(mesa.capacidad,
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
