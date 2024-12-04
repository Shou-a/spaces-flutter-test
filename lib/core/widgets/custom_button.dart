import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final bool isLoading;
  final EdgeInsetsGeometry? margin;

  const CustomButton(
      {super.key,
      required this.text,
      this.backgroundColor = AppColors.primary,
      this.onTap,
      this.isLoading = false,
      this.margin});

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        onTap: widget.isLoading ? null : widget.onTap,
        child: widget.isLoading
            ? SpinKitFadingCircle(
                color: widget.backgroundColor == AppColors.white
                    ? AppColors.bodyText
                    : AppColors.white,
                size: 35,
              )
            : Text(
                widget.text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: widget.backgroundColor == AppColors.white
                          ? AppColors.bodyText
                          : AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
      ),
    );
  }
}
