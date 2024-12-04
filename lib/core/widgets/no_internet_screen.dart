import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import '../../app/app.dart';
import '../theme/colors.dart';
import '../utils/images.dart';

class NoInternetScreen extends StatelessWidget {
  final Widget? child;
  const NoInternetScreen({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.noInternet, width: 150, height: 150),
            Text('OPPS', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text(
              'no internet connection',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 40),
            Container(
                height: 45,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.secondary),
                child: TextButton(
                  onPressed: () async {
                    if (await Connectivity().checkConnectivity() !=
                        ConnectivityResult.none) {
                      Navigator.pushReplacement(Get.context!,
                          MaterialPageRoute(builder: (_) => child!));
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'RETRY',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
