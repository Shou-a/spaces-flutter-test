import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

import '../widgets/cus_dialog.dart';

class LocationHelper {
  static Future<void> checkPermission(
      Function callback, BuildContext context) async {
    PermissionStatus permissionStatus = await Permission.location.status;

    if (permissionStatus.isGranted) {
      callback();
    } else {
      permissionStatus = await Permission.location.request();
    }

    if (permissionStatus.isDenied) {
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CusDialog(
            title: 'You denied location permission.',
            content: const SizedBox(),
            okButtonText: "Retry",
            onOk: () async {
              Navigator.pop(context);
              await Permission.location.request();
              if (context.mounted) {
                checkPermission(callback, context);
              }
            },
          );
        },
      );
    } else if (permissionStatus.isPermanentlyDenied) {
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CusDialog(
            title: 'You denied location permission forever.',
            content: const SizedBox(),
            okButtonText: "Open Settings",
            onOk: () async {
              if (context.mounted) {
                Navigator.pop(context);
                await openAppSettings();
                if (context.mounted) {
                  checkPermission(callback, context);
                }
              }
            },
          );
        },
      );
    } else {
      callback();
    }
  }
}
