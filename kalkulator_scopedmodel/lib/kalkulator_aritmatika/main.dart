import 'package:flutter/material.dart';
import 'package:kalkulator_scopedmodel/kalkulator-bangun-datar/main.dart';
import 'package:kalkulator_scopedmodel/kalkulator_aritmatika/kalkulator_page.dart';
import 'package:kalkulator_scopedmodel/kalkulator_aritmatika/models/kalkulator.dart';
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
