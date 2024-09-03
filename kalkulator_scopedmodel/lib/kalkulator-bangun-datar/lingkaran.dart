import 'package:flutter/material.dart';
import 'package:kalkulator_scopedmodel/calculator_models.dart';
import 'package:scoped_model/scoped_model.dart';

class LingkaranCalculator extends StatefulWidget {
  @override
  _LingkaranCalculatorState createState() => _LingkaranCalculatorState();
}

class _LingkaranCalculatorState extends State<LingkaranCalculator> {
  bool _hasCalculated = false;
  double _radius = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 79, 173), // Matching AppBar color
        title: Text(
          'Kalkulator Lingkaran',
          style: TextStyle(
            color: Colors.white, // Matching text color
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 182, 204, 233), // Matching background color
      body: ScopedModelDescendant<CalculatorModel>(
        builder: (context, child, model) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.circle, // Icon for circle
                  size: 150, // Adjust the size as needed
                  color: Color.fromARGB(255, 105, 139, 182), // Matching icon color
                ),
                SizedBox(height: 16), // Space between icon and next widget
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Jari-Jari Lingkaran',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _radius = double.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      model.setRadius(_radius); // Update model with the current radius value
                      _hasCalculated = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 105, 139, 182), // Background color
                    foregroundColor: Colors.white, // Text color
                  ),
                  child: Text('Hitung'),
                ),
                SizedBox(height: 16),
                if (_hasCalculated) ...[
                  Text(
                    'Luas Lingkaran: ${model.circleArea.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
