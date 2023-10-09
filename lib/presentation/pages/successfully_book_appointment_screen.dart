import 'package:flutter/material.dart';
import 'package:health_checkup_app/presentation/provider/popular_tests.dart';
import 'package:health_checkup_app/presentation/theme/app_colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class SuccessfullyBookAppointment extends StatelessWidget {
  const SuccessfullyBookAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dateTimeProvider = Provider.of<PopularLabTestsProvider>(context);
    final date = dateTimeProvider.selectedDate.toString();
    final time = dateTimeProvider.selectedTime.toString();

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text('Success')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.8,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1.0,
              ),
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/icons/apponintment_book.png'),
                ),
                Container(
                  height: 24,
                  width: 60,
                ),
                Container(
                  width: size.width * 0.8,
                  child: const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Lab tests have been scheduled successfully, You will receive a mail of the same. ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.8,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                '$date ($time)',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: HexColor('#667085')),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.06,
            margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
              child: const Text(
                'Back to home',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
