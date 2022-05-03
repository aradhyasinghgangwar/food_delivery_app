import 'dart:core';

class StoreData
//is a db for storing foodname and price.
{
  StoreData._privateConstructor();
  static final StoreData _instance = StoreData._privateConstructor();

  factory StoreData() {
    return _instance;
  }
  Map<String, int> _foodNamePrice = Map<String, int>();
  void storeFoodDetails(String foodname, int foodprice) {
    print(foodname);
    print(foodprice);
    //store it as a key value pair
    _foodNamePrice[foodname] = foodprice;
    print(_foodNamePrice);
  }

  void removeFoodDetails(String foodName) {
    print("Remove food");
    _foodNamePrice.remove(foodName);
    print(_foodNamePrice);
  }

  Map<String, int> retrieveFoodDetails() {
    print(_foodNamePrice);
    return _foodNamePrice;
  }
}
