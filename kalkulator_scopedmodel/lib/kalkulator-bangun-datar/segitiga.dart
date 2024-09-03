import 'package:flutter/material.dart';
import 'package:kalkulator_scopedmodel/calculator_models.dart';
import 'package:scoped_model/scoped_model.dart';

class SegitigaCalculator extends StatefulWidget {
  @override
  _SegitigaCalculatorState createState() => _SegitigaCalculatorState();
}

class _SegitigaCalculatorState extends State<SegitigaCalculator> {
  bool _hasCalculated = false;
  double _base = 0;
  double _height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 79, 173), // AppBar color
        title: Text(
          'Kalkulator Segitiga',
          style: TextStyle(
            color: Colors.white, // Text color
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 182, 204, 233), // Background color
      body: ScopedModelDescendant<CalculatorModel>(
        builder: (context, child, model) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'image/pizzas.png', // Path to your image
                  height: 150, // Adjust the height as needed
                ),
                SizedBox(height: 16), // Space between image and next widget
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Panjang Alas Segitiga',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _base = double.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Tinggi Segitiga',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _height = double.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      model.setBase(_base);
                      model.setHeight(_height);
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
                    'Luas Segitiga: ${model.triangleArea.toStringAsFixed(2)}',
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
