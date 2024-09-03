import 'package:kalkulator_scopedmodel/kalkulator-bmi/bmi_model.dart';
import 'package:kalkulator_scopedmodel/kalkulator-bmi/bmi_result.dart';
import 'package:kalkulator_scopedmodel/kalkulator-bmi/input_field.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BmiCalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ScopedModelDescendant<BmiModel>(
          builder: (context, child, model) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                InputField(
                  labelText: "Height (cm)",
                  onUpdate: (value) {
                    model.updateHeight(value);
                  },
                ),
                SizedBox(height: 20),
                InputField(
                  labelText: "Weight (kg)",
                  onUpdate: (value) {
                    model.updateWeight(value);
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      model.calculateBmi();
                    },
                    child: Text('Calculate'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      backgroundColor: Color.fromRGBO(245, 255, 112, 1),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                BmiResult(),
              ],
            );
          },
        ),
      ),
    );
  }
}