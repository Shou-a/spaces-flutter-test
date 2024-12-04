import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theme/colors.dart';
import '../widgets/custom_toaster.dart';

class DevelopmentHelper {
  static bool bypass = true;
  static bool isDevMode = true;
  static int selectedDevelopmentLevel = ByPassLevels.level_1.value;
  static bool isUsingDrawer = true;
  static bool isUsingBottomNav = true;

  static bool bypassCheck(ByPassLevels level) {
    return bypass ? level.value >= selectedDevelopmentLevel : false;
  }

  static void underDevelopmentMessage() {
    CusFlutterToast.showToast(
      "under development !",
      fontSize: 18,
      textColor: AppColors.white,
    );
  }

  static void showDevelopmentErrors(msg) {
    if (isDevMode) {
      CusFlutterToast.showToast(
        msg,
        fontSize: 12,
        textColor: AppColors.white,
      );
    }
  }

  static showSnakbar(context, message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(fontSize: 13),
          ),
          duration: const Duration(seconds: 20),
          backgroundColor: Colors.red,
        ),
      );

  static ByPassLevels loginLevel = ByPassLevels.level_1;
  static ByPassLevels signUpLevel = ByPassLevels.level_1;
}

enum ByPassLevels { level_1, level_2, level_3 }

extension ByPassLevelsExtension on ByPassLevels {
  int get value => this.index + 1;
}
