// model tempat untuk codingan penalarannya

import 'package:scoped_model/scoped_model.dart';

class Kalkulator extends Model {
  String _angka1 = '';
  String _angka2 = '';
  String _selectedOperation = '+';
  String _output = '0';

  String get output => _output;
  String get selectedOperation => _selectedOperation;

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
}
