import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Kalkulator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/kalkulatorAritmatika');
              },
              child: const Text('Buka Kalkulator Aritmatika'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/kalkulatorBangunDatar');
              },
              child: const Text('Buka Kalkulator Bangun Datar'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bmiCalculator');
              },
              child: const Text('Buka Kalkulator BMI'),
            ),
          ],
        ),
      ),
    );
  }
}
