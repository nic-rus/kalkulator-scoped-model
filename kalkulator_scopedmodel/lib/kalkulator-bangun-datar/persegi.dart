import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalkulator_scopedmodel/calculator_models.dart';
import 'package:scoped_model/scoped_model.dart';

class PersegiCalculator extends StatefulWidget {
  @override
  _PersegiCalculatorState createState() => _PersegiCalculatorState();
}

class _PersegiCalculatorState extends State<PersegiCalculator> {
  bool _hasCalculated = false;
  double _side = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 79, 173),
        title: Text(
          'Kalkulator Persegi',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: ScopedModelDescendant<CalculatorModel>(
        builder: (context, child, model) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.square, 
                  size: 150, 
                  color: Color.fromARGB(255, 105, 139, 182),
                ),
                SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Panjang Sisi Persegi',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _side = double.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      model.setSide(_side);
                      _hasCalculated = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 105, 139, 182),
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Hitung'),
                ),
                SizedBox(height: 16),
                if (_hasCalculated) ...[
                  Text(
                    'Luas Persegi: ${model.squareArea.toStringAsFixed(2)}',
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
