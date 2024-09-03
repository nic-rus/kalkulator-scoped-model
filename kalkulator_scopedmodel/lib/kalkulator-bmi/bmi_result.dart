import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'bmi_model.dart';

class BmiResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<BmiModel>(
      builder: (context, child, model) {
        return Column(
          children: [
            Text(
              model.bmi == 0 ? 'Enter your details' : 'Your BMI is ${model.bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              model.category,
              style: TextStyle(
                fontSize: 20,
                color: model.category == "Overweight" ? Colors.red : Colors.green,
              ),
            ),
          ],
        );
      },
    );
  }
}
