import 'package:scoped_model/scoped_model.dart';
import 'dart:math';

class CalculatorModel extends Model {
  // Arithmetic Calculator State
  String _angka1 = '';
  String _angka2 = '';
  String _selectedOperation = '+';
  String _output = '0';

  // Shape Calculator State
  double _side = 0;
  double _base = 0;
  double _height = 0;
  double _radius = 0;

  // BMI Calculator State
  double _heightBmi = 0.0;
  double _weightBmi = 0.0;
  double _bmi = 0.0;
  String _category = "";
  bool _showResult = false;

  // Getters for Arithmetic Calculator
  String get output => _output;
  String get selectedOperation => _selectedOperation;

  // Getters for Shape Calculator
  double get squareArea => _side * _side;
  double get squarePerimeter => 4 * _side;
  double get triangleArea => 0.5 * _base * _height;
  double get circleArea => pi * _radius * _radius;

  // Getters for BMI Calculator
  double get bmi => _bmi;
  String get category => _category;
  bool get showResult => _showResult;

  // Arithmetic Calculator Methods
  void setAngka1(String value) {
    _angka1 = value;
  }

  void setAngka2(String value) {
    _angka2 = value;
  }

  void setOperation(String value) {
    _selectedOperation = value;
  }

  void calculateResult() {
    double num1 = double.tryParse(_angka1) ?? 0;
    double num2 = double.tryParse(_angka2) ?? 0;
    double result = 0;

    switch (_selectedOperation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num2 != 0 ? num1 / num2 : 0;
        break;
    }

    _output = result.toString();
    notifyListeners();
  }

  // Shape Calculator Methods
  void setSide(double value) {
    _side = value;
    notifyListeners();
  }

  void setBase(double value) {
    _base = value;
    notifyListeners();
  }

  void setHeight(double value) {
    _height = value;
    notifyListeners();
  }

  void setRadius(double value) {
    _radius = value;
    notifyListeners();
  }

  // BMI Calculator Methods
  void updateHeight(String value) {
    if (value.isEmpty) {
      _showResult = false;
    } else {
      try {
        _heightBmi = double.parse(value);
      } catch (e) {
        _showResult = false;
      }
    }
    notifyListeners();
  }

  void updateWeight(String value) {
    if (value.isEmpty) {
      _showResult = false;
    } else {
      try {
        _weightBmi = double.parse(value);
      } catch (e) {
        _showResult = false;
      }
    }
    notifyListeners();
  }

  void calculateBmi() {
    if (_heightBmi > 0 && _weightBmi > 0) {
      _bmi = _weightBmi / ((_heightBmi / 100) * (_heightBmi / 100));
      if (_bmi < 18.5) {
        _category = "Underweight";
      } else if (_bmi < 24.9) {
        _category = "Normal weight";
      } else {
        _category = "Overweight";
      }
      _showResult = true;
    } else {
      _bmi = 0.0;
      _category = "Please enter valid numbers";
      _showResult = false;
    }
    notifyListeners();
  }
}
