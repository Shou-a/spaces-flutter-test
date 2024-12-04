import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'cus_dialog.dart';
import 'custom_widget.dart';


Future<bool> confirmationDialog(BuildContext context,
    {String caution = "",
    bool isActionDanger = false,
    IconData? cautionIcon}) async {
  bool isConfirm = false;
  await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setStateSB) {
          return CusDialog(
            contentPadding: EdgeInsets.zero,
            bottomelevated: false,
            bgColor: AppColors.white,
            leftSpace: 40,
            rightSpace: 40,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (cautionIcon != null)
                  Icon(cautionIcon,
                      color: isActionDanger
                          ? AppColors.warningHigh
                          : AppColors.primary,
                      size: 55),
                const HeightBox(10),
                Center(
                  child: Text(
                    'Are you sure?',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.bodyText,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                  ),
                ),
                Center(
                  child: Text(
                    caution,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: AppColors.subText),
                  ),
                ),
                const HeightBox(8),
              ],
            ),
            onOk: () {
              isConfirm = true;
              Navigator.pop(context);
            },
            onCancel: () {
              Navigator.pop(context);
            },
            okButtonColor:
                isActionDanger ? AppColors.warningHigh : AppColors.primary,
            okButtonText: 'Sure',
            cancelButtonColor: AppColors.white,
            cancelButtonText: 'Cancel',
            cancelTextcolor: AppColors.subText,
            cancelButtonBorder: Border.all(color: AppColors.subText),
            okButtonBorder: Border.all(
                color:
                    isActionDanger ? AppColors.warningHigh : AppColors.primary),
            actionsPadding: const EdgeInsets.only(bottom: 10),
            actionsAlignment: MainAxisAlignment.center,
          );
        });
      });
  return isConfirm;
}
