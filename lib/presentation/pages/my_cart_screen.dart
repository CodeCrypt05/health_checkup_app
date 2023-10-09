import 'package:flutter/material.dart';
import 'package:health_checkup_app/presentation/pages/order_review_screen.dart';
import 'package:health_checkup_app/presentation/theme/app_colors.dart';
import 'package:health_checkup_app/presentation/widget/my_cart_widgets/tests_card_widget.dart';
import 'package:health_checkup_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
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
              return _buildCartList(size, context);
            }
          },
        ));
  }

  Widget _buildCartList(Size size, BuildContext context) {
    final cartList = Provider.of<CartProvider>(context);
    return FutureBuilder(
      future: cartList.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: size.height * 0.99,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 32, right: 32),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OrderReviewScreen()));
                  },
                  child: Card(
                    elevation: 2,
                    child: Container(
                      width: 300,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TestsCardWidget(
                        index: index,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16);
              },
            ),
          );
        }
        return Container();
      },
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
