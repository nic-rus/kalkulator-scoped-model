import 'package:flutter/material.dart';
import 'package:kalkulator_scopedmodel/calculator_models.dart';
import 'package:scoped_model/scoped_model.dart';

class BangunDatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CalculatorModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Kalkulator Bangun Datar'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/persegi', 
                    );
                  },
                  child: const Text('Persegi'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/lingkaran', 
                    );
                  },
                  child: const Text('Lingkaran'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/segitiga', 
                    );
                  },
                  child: const Text('Segitiga'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
