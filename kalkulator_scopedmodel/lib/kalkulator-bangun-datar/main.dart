import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'shape_model.dart';
import 'persegi.dart';
import 'lingkaran.dart';
import 'segitiga.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ShapeModel>(
      model: ShapeModel(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 79, 173),
        title: Text(
          'Kalkulator Luas Bangun Datar',
          style: TextStyle(
            color: Colors.white, // Change this to your desired color
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 182, 204, 233),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildItem(context, 'Persegi', Icons.crop_square, PersegiCalculator()),
            _buildItem(context, 'Lingkaran', Icons.circle, LingkaranCalculator()),
            _buildItem(context, 'Segitiga', Icons.change_history, SegitigaCalculator()),
          ],
        ),
      ),
    );
  }

  // Helper function to create ListView items
  Widget _buildItem(BuildContext context, String title, IconData icon, Widget calculator) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => calculator,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 141, 144, 238),  // New background color
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [  
            BoxShadow(
              color: Color.fromARGB(255, 43, 42, 50).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 40),
            SizedBox(width: 20),
            Text(title, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
