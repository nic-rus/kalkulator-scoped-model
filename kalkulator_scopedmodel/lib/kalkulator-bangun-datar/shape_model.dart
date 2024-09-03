import 'package:scoped_model/scoped_model.dart';
import 'dart:math';

class ShapeModel extends Model {
  double _side = 0;
  double _base = 0;
  double _height = 0;
  double _radius = 0;
  
  double get side => _side;
  double get base => _base;
  double get height => _height;
  double get radius => _radius;
  
  double get squareArea => _side * _side;
  double get squarePerimeter => 4 * _side;
  double get triangleArea => 0.5 * _base * _height;
  double get circleArea => pi * _radius * _radius;

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
}
