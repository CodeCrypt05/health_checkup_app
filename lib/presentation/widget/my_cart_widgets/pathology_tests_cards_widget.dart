import 'package:flutter/material.dart';
import 'package:health_checkup_app/data/database/db_helper.dart';
import 'package:health_checkup_app/presentation/provider/cart_provider.dart';
import 'package:health_checkup_app/presentation/theme/app_colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class PathologyTestsCardWidget extends StatelessWidget {
  PathologyTestsCardWidget({
    super.key,
    required this.index,
  });

  final int index;
  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cartList = Provider.of<CartProvider>(context);
    return FutureBuilder(
      future: cartList.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.only(top: 8, left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      snapshot.data![index].title.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      snapshot.data![index].discountPrice.toString(),
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
                  child: Text(
                    snapshot.data![index].price.toString(),
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    dbHelper.delete(snapshot.data![index].title.toString());
                    cartList.removeCounter();
                  },
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
          );
        }
        return Container();
      },
    );
  }
}
