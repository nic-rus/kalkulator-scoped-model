import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class BmiModel extends Model {
  double _height = 0.0;
  double _weight = 0.0;
  double _bmi = 0.0;
  String _category = "";
  bool _showResult = false;
  bool isHeightValid = true;
  bool isWeightValid = true;

  double get bmi => _bmi;
  String get category => _category;
  bool get showResult => _showResult;

  void updateHeight(String value) {
    if (value.isEmpty) {
      isHeightValid = false;
    } else {
      try {
        _height = double.parse(value);
        isHeightValid = true;
      } catch (e) {
        isHeightValid = false;
      }
    }
    _showResult = false;
    notifyListeners();
  }

  void updateWeight(String value) {
    if (value.isEmpty) {
      isWeightValid = false;
    } else {
      try {
        _weight = double.parse(value);
        isWeightValid = true;
      } catch (e) {
        isWeightValid = false;
      }
    }
    _showResult = false;
    notifyListeners();
  }

  void calculateBmi() {
    if (_height > 0 && _weight > 0) {
      _bmi = _weight / ((_height / 100) * (_height / 100));
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