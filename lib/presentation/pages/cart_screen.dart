import 'package:flutter/material.dart';
import 'package:health_checkup_app/data/database/db_helper.dart';
import 'package:health_checkup_app/presentation/pages/book_appointment_time_screen.dart';
import 'package:health_checkup_app/presentation/pages/successfully_book_appointment_screen.dart';
import 'package:health_checkup_app/presentation/provider/cart_provider.dart';
import 'package:health_checkup_app/presentation/provider/popular_tests.dart';
import 'package:health_checkup_app/presentation/theme/app_colors.dart';
import 'package:health_checkup_app/presentation/widget/my_cart_widgets/pathology_tests_cards_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dateTimeProvider = Provider.of<PopularLabTestsProvider>(context);

    final date = dateTimeProvider.selectedDate.toString();
    final time = dateTimeProvider.selectedTime.toString();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Order Review'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_rounded,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          if (value.getCounter() == 0) {
            return _buildEmptyCart(size);
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  order_review(size),
                  lab_tests_card(context),
                  date_time_card(size, context, date, time),
                  order_summary_card(size),
                  hard_copy_of_reports(size),
                  schedule_btn(size, date, time, context),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget order_review(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.04,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 14),
      child: Text(
        'Order review',
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget lab_tests_card(BuildContext context) {
    final cartList = Provider.of<CartProvider>(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      margin: const EdgeInsets.only(top: 8, left: 20, right: 20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
              color: AppColors.secondaryColor,
            ),
            alignment: Alignment.center,
            width: double.infinity,
            height: 40,
            child: const Text(
              'Pathology tests',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),

          // Main Content Start from here
          FutureBuilder(
            future: cartList.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        PathologyTestsCardWidget(
                          index: index,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 14, right: 14),
                          child: const Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 30,
                          ),
                        )
                      ],
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget date_time_card(
      Size size, BuildContext context, String date, String time) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      margin: const EdgeInsets.only(top: 8, left: 20, right: 20),
      height: size.height * 0.1,
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(top: 8, left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              size: 28,
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 240,
              child: TextButton(
                style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BookAppointmentTimeScreen(),
                    ),
                  );
                },
                child: Text(
                  date.isEmpty || time.isEmpty
                      ? 'Select date'
                      : '$date ($time)',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget order_summary_card(Size size) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      margin: const EdgeInsets.only(top: 8, left: 20, right: 20),
      height: size.height * 0.18,
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'M.R.P Total',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: HexColor('#475569'),
                  ),
                ),
                FutureBuilder(
                  future: dbHelper.sumAllPrices(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final totalPrice = snapshot.data ?? 0.0;
                      return Text(
                        totalPrice.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: HexColor('#475569'),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: HexColor('#475569'),
                  ),
                ),
                FutureBuilder(
                  future: dbHelper.calculateTotalSavings(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final totalSavings = snapshot.data ?? 0.0;
                      return Text(
                        totalSavings.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: HexColor('#475569'),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amount to be paid',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor,
                  ),
                ),
                FutureBuilder(
                  future: dbHelper.amountToPaid(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final amountToBePaid = snapshot.data ?? 0.0;
                      return Text(
                        amountToBePaid.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primaryColor,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Total Savings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: HexColor('#475569'),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                FutureBuilder(
                  future: dbHelper.calculateTotalSavings(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final amountToBePaid = snapshot.data ?? 0.0;
                      Text(
                        amountToBePaid.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primaryColor,
                        ),
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget hard_copy_of_reports(Size size) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      margin: EdgeInsets.only(top: 8, left: 20, right: 20),
      height: size.height * 0.16,
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.only(top: 16, left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 4),
              alignment: Alignment.topLeft,
              height: double.infinity,
              width: 30,
              child: const Icon(
                Icons.circle_outlined,
                size: 18,
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hard copy of reports',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched. ',
                      style:
                          TextStyle(fontSize: 12, color: HexColor('#667085')),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '₹150 per person',
                      style: TextStyle(
                        fontSize: 12,
                        color: HexColor('667085'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget schedule_btn(
      Size size, String date, String time, BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.06,
      margin: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SuccessfullyBookAppointment(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: date.isNotEmpty && time.isNotEmpty
              ? AppColors.primaryColor
              : Colors.grey,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
        ),
        child: const Text(
          'Schedule',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildEmptyCart(Size size) {
    return Container(
      height: size.height * 0.99,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.asset('assets/icons/empty_cart.png'),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Nothing is in Your Cart.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
