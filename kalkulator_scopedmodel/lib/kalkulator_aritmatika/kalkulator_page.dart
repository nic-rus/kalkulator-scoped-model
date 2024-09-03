import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalkulator/models/kalkulator.dart';
import 'package:scoped_model/scoped_model.dart';

class KalkulatorPage extends StatelessWidget {
  const KalkulatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Aritmatika'),
      ),
      // ScopedModelDescendant<Kalkulator> untuk instance dari kalkulator
      body: ScopedModelDescendant<Kalkulator>(
        builder: (context, child, model) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Angka 1',
                  ),
                  onChanged: (value) {
                    model.setAngka1(value);
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Angka 2',
                  ),
                  onChanged: (value) {
                    model.setAngka2(value);
                  },
                ),
                const SizedBox(height: 20),
                DropdownButton<String>(
                  value: model.selectedOperation,
                  items: ['+', '-', '*', '/'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    model.setOperation(value!);
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    model.calculateResult();
                  },
                  child: Text(
                    'Hitung',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Hasil: ${model.output}',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
