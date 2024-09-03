import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'shape_model.dart';

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
      body: ScopedModelDescendant<ShapeModel>(
        builder: (context, child, model) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'image/roda.png', // Path to your image
                  height: 150, // Adjust the height as needed
                ),
                SizedBox(height: 16), // Space between image and next widget
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
