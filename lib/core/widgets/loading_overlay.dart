import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/colors.dart';
import 'custom_widget.dart';

class LoadingOverlay extends StatefulWidget {
  final bool isLoading;
  final bool isLoadingIconShow;
  final Widget child;
  final Color backgroundColor;
  final Widget? progressIndicator;
  final String? displayMsg;
  final double? overlayOpacity;

  const LoadingOverlay(
      {super.key,
      required this.isLoading,
      required this.child,
      this.isLoadingIconShow = true,
      this.backgroundColor = AppColors.white,
      this.progressIndicator,
      this.displayMsg,
      this.overlayOpacity});

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (widget.isLoading && widget.overlayOpacity != 0)
          Positioned.fill(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.primary.withOpacity(widget.overlayOpacity ?? .33),
          )),
        if (widget.isLoading)
          Center(
            child: widget.progressIndicator ??
                const SpinKitPulsingGrid(
                  color: AppColors.primary,
                  size: 50.0,
                ),
          )
      ],
    );
  }
}
