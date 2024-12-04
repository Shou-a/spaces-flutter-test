import 'package:base_project/app/app.dart';
import 'package:base_project/core/theme/colors.dart';
import 'package:flutter/material.dart';

enum ToastAlignment { center, topCenter, bottomCenter }

class CusFlutterToast {
  static Future<void> showToast(String msg,
      {bool isError = false,
      Color textColor = AppColors.white,
      double fontSize = 16.0,
      Duration duration = const Duration(seconds: 4),
      ToastAlignment align = ToastAlignment.bottomCenter}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    OverlayState? overlayState = navigatorKey.currentState?.overlay;

    if (overlayState == null) return;

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => _AnimatedToast(
        message: msg,
        backgroundColor: isError ? AppColors.warningHigh : AppColors.primary,
        textColor: textColor,
        fontSize: fontSize,
        duration: duration,
        alignment: align,
      ),
    );

    overlayState.insert(overlayEntry);
    await Future.delayed(duration);
    overlayEntry.remove();
  }
}

class _AnimatedToast extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final Duration duration;
  final ToastAlignment alignment;

  const _AnimatedToast(
      {Key? key,
      required this.message,
      required this.backgroundColor,
      required this.textColor,
      required this.fontSize,
      required this.duration,
      required this.alignment})
      : super(key: key);

  @override
  _AnimatedToastState createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<_AnimatedToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _offsetAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset(-2, 0),
          end: Offset(0, 0),
        ).chain(CurveTween(curve: Curves.bounceIn)),
        weight: 15,
      ),
      TweenSequenceItem(tween: ConstantTween<Offset>(Offset(0, 0)), weight: 70),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset(0, 0),
          end: Offset(2, 0),
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 15,
      ),
    ]).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Positioned(
        top: (size.height / 100) *
            (widget.alignment == ToastAlignment.topCenter
                ? 5
                : (widget.alignment == ToastAlignment.center ? 48 : 85)),
        left: 0,
        right: 0,
        child: SlideTransition(
            position: _offsetAnimation,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 7),
                  decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.white, width: .75)),
                  child: Text(
                    widget.message,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                ),
              ),
            )));
  }
}
