import 'package:flutter/material.dart';
import 'package:health_checkup_app/presentation/widget/home_screen_widgets/oulined_btn_style_widget.dart';
import 'package:health_checkup_app/theme/app_colors.dart';
import 'package:hexcolor/hexcolor.dart';

class MyCartScreen extends StatelessWidget {
  MyCartScreen({super.key});

  OutlinedBtnStyleWidget outlinedBtnStyleWidget = OutlinedBtnStyleWidget();
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
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
      body: Column(
        children: [
          order_review(size),
          SingleChildScrollView(
            child: Column(
              children: [
                lab_tests_card(size),
                date_time_card(size),
                order_summary_card(size),
                hard_copy_of_reports(size),
              ],
            ),
          ),
          schedule_btn(size),
        ],
      ),
    );
  }

  Widget order_review(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.04,
      margin: EdgeInsets.only(left: 20, right: 20, top: 14),
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

  Widget lab_tests_card(Size size) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      margin: EdgeInsets.only(top: 8, left: 20, right: 20),
      height: size.height * 0.24,
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
          Container(
            margin: EdgeInsets.only(top: 8, left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Thyroid Profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '1000/-',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#1BA9B5'),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: const Text(
                    '₹ 1400',
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_outline,
                    size: 18,
                    color: AppColors.primaryColor,
                  ),
                  label: Text(
                    'Remove',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: AppColors.primaryColor,
                      width: 2.0,
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.file_upload_outlined,
                    size: 18,
                    color: AppColors.primaryColor,
                  ),
                  label: Text(
                    'Upload prescription (optional)',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: AppColors.primaryColor,
                      width: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget date_time_card(Size size) {
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
                onPressed: () {},
                child: const Text(
                  'Select date',
                  style: TextStyle(
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
      margin: EdgeInsets.only(top: 8, left: 20, right: 20),
      height: size.height * 0.18,
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.only(top: 16, left: 24, right: 24),
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
                Text(
                  '1400',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: HexColor('#475569'),
                  ),
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
                Text(
                  '400',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: HexColor('#475569'),
                  ),
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
                Text(
                  '₹ 1000/-',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor,
                  ),
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
                Text(
                  '₹ 400/-',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor,
                  ),
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
                    Text(
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

  Widget schedule_btn(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.06,
      margin: EdgeInsets.only(top: 16, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(69, 69, 202, 1),
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
}
