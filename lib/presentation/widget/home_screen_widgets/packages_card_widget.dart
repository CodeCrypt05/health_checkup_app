import 'package:flutter/material.dart';
import 'package:health_checkup_app/presentation/widget/home_screen_widgets/oulined_btn_style_widget.dart';
import 'package:health_checkup_app/theme/app_colors.dart';
import 'package:hexcolor/hexcolor.dart';

class PackagesCard extends StatelessWidget {
  PackagesCard({super.key});

  OutlinedBtnStyleWidget outlinedBtnStyleWidget = OutlinedBtnStyleWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8, left: 8),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icons/medicine.png'),
                    ),
                  ),
                  height: 80,
                  width: 80,
                ),
                Container(
                  margin: EdgeInsets.only(top: 8, right: 8),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icons/safe_tag.png'),
                    ),
                  ),
                  height: 26,
                  width: 80,
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 28,
            margin: EdgeInsets.only(left: 20, right: 20, top: 4),
            child: const Text(
              'Full Body Checkup',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 20, right: 20, top: 8),
            child: Text(
              'Includes 92 tests',
              style: TextStyle(color: AppColors.subTextColor),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 32, right: 20, top: 4),
            child: Text(
              '* Blood Glucose Fasting ',
              style: TextStyle(color: AppColors.subTextColor),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 32, right: 20, top: 4),
            child: Text(
              '* Liver Function Test',
              style: TextStyle(color: AppColors.subTextColor),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 20, right: 20, top: 8),
            child: Text(
              'View more',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.subTextColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹ 2000/-',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: HexColor('#1BA9B5'),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 140,
                  height: 36,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: outlinedBtnStyleWidget.customButtonStyle,
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 12),
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
}
