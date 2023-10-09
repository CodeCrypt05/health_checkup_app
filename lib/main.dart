import 'package:flutter/material.dart';
import 'package:health_checkup_app/presentation/pages/home_screen.dart';
import 'package:health_checkup_app/presentation/provider/cart_provider.dart';
import 'package:health_checkup_app/presentation/provider/popular_tests.dart';
import 'package:provider/provider.dart';

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

    CartProvider cartProvider = CartProvider();
    PopularLabTestsProvider popularLabTestsProvider = PopularLabTestsProvider();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>.value(value: cartProvider),
        ChangeNotifierProvider<PopularLabTestsProvider>.value(
            value: popularLabTestsProvider),
      ],
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: customColorScheme,
              useMaterial3: true,
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
