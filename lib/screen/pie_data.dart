import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    // Data(name: 'Amber', percent: 10, color: Colors.amber),
    // Data(name: 'Orange', percent: 40, color: Colors.orange),
    Data(name: 'Donaciones', percent: 70, color: Colors.orange),
    Data(
        name: 'Voluntariados',
        percent: 30,
        color: Color.fromARGB(255, 39, 109, 231)),
  ];
}

class Data {
  final String name;
  final double percent;
  final Color color;
  Data({required this.name, required this.percent, required this.color});
}
