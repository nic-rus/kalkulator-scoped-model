import 'package:flutter/material.dart';
import 'package:kalkulator/home_page.dart';
import 'package:kalkulator/kalkulator_page.dart';
import 'package:kalkulator/models/kalkulator.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<Kalkulator>(
      model: Kalkulator(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/kalkulator': (context) => const KalkulatorPage(),
        },
      ),
    );
  }
}
