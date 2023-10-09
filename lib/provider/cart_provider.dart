import 'package:flutter/material.dart';
import 'package:health_checkup_app/database/db_helper.dart';
import 'package:health_checkup_app/models/popular_tests.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  DBHelper dbHelper = DBHelper();
  int _counter = 0;
  int get counter => _counter;

  late Future<List<PopularLabTests>> _popularLabTestsList;
  Future<List<PopularLabTests>> get popularLabTestsList => _popularLabTestsList;

  Future<List<PopularLabTests>> getData() async {
    _popularLabTestsList = dbHelper.getCartList();
    return _popularLabTestsList;
  }

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    notifyListeners();
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    return _counter;
  }
}
