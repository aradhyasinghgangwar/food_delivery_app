import 'package:equatable/equatable.dart';

abstract class FoodModel extends Equatable {
  final String name;
  final int price;

  FoodModel({required this.name, required this.price});

  @override
  String toString() {
    return 'FoodModel{name: $name, price: $price}';
  }
}
