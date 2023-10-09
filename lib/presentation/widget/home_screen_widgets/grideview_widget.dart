import 'package:flutter/material.dart';
import 'package:health_checkup_app/data/dummy_data/dummy_data.dart';
import 'package:health_checkup_app/presentation/widget/home_screen_widgets/lab_tests_card_widget.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 13,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          mainAxisExtent: 232,
        ),
        itemCount: popularLabTests.length,
        itemBuilder: (context, index) {
          final popularTest = popularLabTests[index];
          return GestureDetector(
            onTap: () {},
            child: GridTile(
              child: Container(
                height: 800.0,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 1.0,
                  ),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: LabTestsCardWidget(popularLabTests: popularTest),
              ),
            ),
          );
        },
      ),
    );
  }
}
