import 'package:flutter/material.dart';
import 'package:health_checkup_app/presentation/theme/app_colors.dart';

class OutlinedBtnStyleWidget {
  final customButtonStyle = OutlinedButton.styleFrom(
    backgroundColor: Colors.white,
    fixedSize: const Size(140, 0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
    ),
    side: BorderSide(
      color: AppColors.primaryColor,
      width: 1.0,
    ),
  );
}
