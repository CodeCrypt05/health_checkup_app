// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:health_checkup_app/presentation/theme/app_colors.dart';
import 'package:health_checkup_app/presentation/widget/home_screen_widgets/grideview_widget.dart';
import 'package:health_checkup_app/presentation/widget/home_screen_widgets/listview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Logo'),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: AppColors.primaryColor,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            popular_lab_tests(size),
            Container(
              height: 480,
              width: double.infinity,
              child: GridViewWidget(),
            ),
            popular_packages(size),
            Container(
              height: 360,
              width: double.infinity,
              child: ListViewWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget popular_lab_tests(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.05,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Popular lab tests',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'View more',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 14,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget popular_packages(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.04,
      margin: EdgeInsets.only(left: 20, right: 20, top: 14),
      child: Text(
        'Popular Packages',
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
