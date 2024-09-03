import 'package:flutter/material.dart';
import 'package:kalkulator_scopedmodel/calculator_models.dart';
import 'package:kalkulator_scopedmodel/kalkulator-bangun-datar/bangun_datar_page.dart';
import 'package:kalkulator_scopedmodel/kalkulator-bangun-datar/lingkaran.dart';
import 'package:kalkulator_scopedmodel/kalkulator-bangun-datar/persegi.dart';
import 'package:kalkulator_scopedmodel/kalkulator-bangun-datar/segitiga.dart';
import 'package:kalkulator_scopedmodel/kalkulator-bmi/bmi_calculator.dart';
import 'package:kalkulator_scopedmodel/kalkulator_aritmatika/kalkulator_page.dart';
import 'package:scoped_model/scoped_model.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CalculatorModel>(
      model: CalculatorModel(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/kalkulatorAritmatika': (context) => KalkulatorPage(),
          '/kalkulatorBangunDatar': (context) => BangunDatarPage(),
          '/bmiCalculator': (context) => BmiCalculatorScreen(),
          '/persegi': (context) => PersegiCalculator(),
          '/lingkaran': (context) => LingkaranCalculator(),
          '/segitiga': (context) => SegitigaCalculator(),
        },
      ),
    );
  }
}
