import 'package:flutter/material.dart';
import 'input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF14192d),
        scaffoldBackgroundColor: Color(0xFF1c2135),
      ),
      home: InputPage(),
    );
  }
}
