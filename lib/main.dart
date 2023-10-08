import 'package:flutter/material.dart';
import 'package:health_checkup_app/presentation/pages/book_appointment_screen.dart';
import 'package:health_checkup_app/presentation/pages/my_cart_screen.dart';
import 'package:health_checkup_app/presentation/pages/order_review_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const customColorScheme = ColorScheme.light(
      primary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color.fromARGB(255, 255, 255, 255),
      background: Colors.white,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: customColorScheme,
        useMaterial3: true,
      ),
      home: OrderReviewScreen(),
    );
  }
}
