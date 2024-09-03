import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'shape_model.dart';

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
            color: Colors.white, // Set the text color here
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 182, 204, 233),
      body: ScopedModelDescendant<ShapeModel>(
        builder: (context, child, model) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'image/win.png', // Path to your image
                  height: 150, // Adjust the height as needed
                ),
                SizedBox(height: 16), // Space between image and next widget
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
                      model.setSide(_side); // Update model with the current side value
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
