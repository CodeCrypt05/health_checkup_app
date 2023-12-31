import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_checkup_app/data/database/db_helper.dart';
import 'package:health_checkup_app/data/models/popular_tests.dart';
import 'package:health_checkup_app/presentation/theme/app_colors.dart';
import 'package:health_checkup_app/presentation/widget/home_screen_widgets/oulined_btn_style_widget.dart';
import 'package:health_checkup_app/presentation/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class LabTestsCardWidget extends StatelessWidget {
  LabTestsCardWidget({
    super.key,
    required this.popularLabTests,
  });

  final OutlinedBtnStyleWidget outlinedBtnStyleWidget =
      OutlinedBtnStyleWidget();

  final PopularLabTests popularLabTests;
  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return GridTile(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
            alignment: Alignment.center,
            width: double.infinity,
            height: 40,
            child: Text(
              popularLabTests.title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 12, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: const Text('Includes 3 tests'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icons/badge.png'),
                    ),
                  ),
                  height: 32,
                  width: 36,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 12, top: 8),
            child: const Text(
              'Get reports in 24 hours',
              style: TextStyle(fontSize: 10),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 14, top: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${popularLabTests.discountPrice}',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryColor),
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  '${popularLabTests.price}',
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
          // Add to cart Button
          Container(
            margin: const EdgeInsets.only(top: 18),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  height: 36,
                  child: ElevatedButton(
                    // onPressed: () async {
                    // //   await dbHelper
                    // //       .insert(PopularLabTests(
                    // //     title: popularLabTests.title,
                    // //     discountPrice: popularLabTests.discountPrice,
                    // //     price: popularLabTests.price,
                    // //   ))
                    // //       .then((value) {
                    // //     cart.addCounter();
                    // //     print('Product is added to cart');
                    // //   }).onError((error, stackTrace) {
                    // //     print(error.toString());
                    // //   });
                    // // },
                    onPressed: () async {
                      bool primaryKeyExists =
                          await dbHelper.isTestIdExists(popularLabTests.title);
                      if (primaryKeyExists) {
                        Fluttertoast.showToast(
                            msg: 'This lab test is already exist in cart',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 10.0);
                      } else {
                        await dbHelper
                            .insert(PopularLabTests(
                          title: popularLabTests.title,
                          discountPrice: popularLabTests.discountPrice,
                          price: popularLabTests.price,
                        ))
                            .then((value) {
                          cart.addCounter();
                          print('Product is added to cart');
                        }).onError((error, stackTrace) {
                          print(error.toString());
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                    ),
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 140,
                  height: 36,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: outlinedBtnStyleWidget.customButtonStyle,
                    child: Text(
                      'View Details',
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
