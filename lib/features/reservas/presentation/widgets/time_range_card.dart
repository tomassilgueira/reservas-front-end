import 'package:flutter/material.dart';

class TimeRangeCard extends StatelessWidget {
  final String rangeString;
  final Color color;
  const TimeRangeCard(
      {Key key, @required this.rangeString, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: Card(
        color: color,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              rangeString.replaceAll(' ', '\n '),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}