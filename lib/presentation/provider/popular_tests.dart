import 'package:flutter/material.dart';

class PopularLabTestsProvider extends ChangeNotifier {
  String title = '';
  String discountPrice = '';
  String price = '';

  String selectedDate = '';
  String selectedTime = '';

  void setData(String title, String discountPrice, String price) {
    this.title = title;
    this.discountPrice = discountPrice;
    this.price = price;
    notifyListeners();
  }

  void setTimeDate(String selectedDate, String selectedTime) {
    this.selectedDate = selectedDate;
    this.selectedTime = selectedTime;
  }
}
