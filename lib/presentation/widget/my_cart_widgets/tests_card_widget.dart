import 'package:flutter/material.dart';
import 'package:health_checkup_app/database/db_helper.dart';
import 'package:health_checkup_app/presentation/theme/app_colors.dart';
import 'package:health_checkup_app/provider/cart_provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class TestsCardWidget extends StatelessWidget {
  TestsCardWidget({super.key, required this.index});

  final int index;
  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cartList = Provider.of<CartProvider>(context);
    return FutureBuilder(
      future: cartList.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridTile(
            child: Column(
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
                  height: 46,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // title
                        Text(
                          snapshot.data![index].title.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // Delete card
                        InkWell(
                          onTap: () {
                            dbHelper
                                .delete(snapshot.data![index].title.toString());
                            cartList.removeCounter();
                          },
                          child: const SizedBox(
                            height: 18,
                            width: 18,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Includes 3 tests',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#475569'),
                        ),
                      ),
                      // discount price
                      Text(
                        snapshot.data![index].discountPrice.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: HexColor('#1BA9B5'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Get reports in 24 hours',
                        style: TextStyle(
                          fontSize: 12,
                          color: HexColor('#475569'),
                        ),
                      ),
                      // price
                      Text(
                        snapshot.data![index].price.toString(),
                        style: TextStyle(
                            fontSize: 12,
                            color: HexColor('#475569'),
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
