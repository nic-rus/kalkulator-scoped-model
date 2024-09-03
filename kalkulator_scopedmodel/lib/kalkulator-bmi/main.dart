import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'bmi_calculator.dart'; // Import your file here
import 'bmi_model.dart';
import 'bmi_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<BmiModel>(
      model: BmiModel(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => BmiMenu(),
          '/bmi_calculator': (context) => BmiCalculatorScreen(), // Define your route here
        },
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}