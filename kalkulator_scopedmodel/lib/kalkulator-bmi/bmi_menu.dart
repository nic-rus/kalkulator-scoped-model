import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'bmi_model.dart';

class BmiMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true, // Center the title of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ScopedModelDescendant<BmiModel>(
          builder: (context, child, model) {
            return Center( // Center everything inside the body
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimize the column size to fit the content
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
                  SizedBox(height: 8),
                  Text(
                    'Nicholas / 11 PPLG 1 / 28',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/bmi_calculator', // Use the route name here
                      );
                    },
                    child: Text('Use Calculator'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
