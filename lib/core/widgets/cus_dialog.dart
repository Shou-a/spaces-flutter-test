import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../localization/app_localizations/app_localization.dart';
import '../theme/colors.dart';
import '../theme/theme.dart';
import '../utils/lang_const.dart';

class CusDialog extends StatefulWidget {
  final String? title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final Widget? icon;
  final bool isTitleCenter;
  final Widget content;
  final VoidCallback? onCancel;
  final VoidCallback? onOk;
  final String? okButtonText;
  final String? cancelButtonText;
  final Color? cancelButtonColor;
  final bool bottomelevated;
  final bool isBgTransparent;
  final Color? okButtonColor;
  final int? leftSpace;
  final int? rightSpace;
  final Color? bgColor;
  final MainAxisAlignment? actionsAlignment;
  final EdgeInsets? insetPadding;
  final EdgeInsetsGeometry? contentPadding;
  final BoxBorder? cancelButtonBorder;
  final BoxBorder? okButtonBorder;
  final Color? cancelTextcolor;
  final EdgeInsetsGeometry? actionsPadding;
  final List<BoxShadow>? buttonBoxShadow;
  final bool isLoading;

  const CusDialog({
    super.key,
    this.title,
    required this.content,
    this.titleStyle,
    this.icon,
    this.onCancel,
    this.onOk,
    this.okButtonText,
    this.okButtonColor,
    this.cancelButtonColor,
    this.cancelButtonText,
    this.bottomelevated = false,
    this.subTitle,
    this.isTitleCenter = false,
    this.isBgTransparent = false,
    this.leftSpace,
    this.rightSpace,
    this.bgColor = AppColors.primary,
    this.actionsAlignment,
    this.insetPadding,
    this.contentPadding,
    this.cancelButtonBorder,
    this.cancelTextcolor,
    this.actionsPadding,
    this.buttonBoxShadow,
    this.okButtonBorder,
    this.isLoading = false,
  });

  @override
  State<CusDialog> createState() => _CusDialogState();
}

class _CusDialogState extends State<CusDialog> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double availableHeight =
        size.height - MediaQuery.of(context).viewInsets.bottom;

    return AlertDialog(
      contentPadding: widget.contentPadding,
      insetPadding: widget.insetPadding ??
          EdgeInsets.only(
              top: 35,
              left: widget.leftSpace?.toDouble() ?? 10.0,
              right: widget.rightSpace?.toDouble() ?? 10.0,
              bottom: widget.bottomelevated ? (size.height / 4) : 35),
      shadowColor: widget.isBgTransparent ? Colors.transparent : Colors.black,
      surfaceTintColor:
          widget.isBgTransparent ? Colors.transparent : Colors.white,
      content: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: availableHeight * 0.85, minWidth: size.width),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  widget.icon != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: widget.icon,
                        )
                      : const SizedBox(),
                  widget.title != null
                      ? SizedBox(
                          width: double.infinity,
                          child: Text(
                            widget.title!,
                            style: widget.titleStyle ??
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.bodyText,
                                      letterSpacing: 1,
                                    ),
                            textAlign: widget.isTitleCenter
                                ? TextAlign.center
                                : TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        )
                      : const SizedBox(),
                  widget.subTitle != null
                      ? Container(
                          padding: const EdgeInsets.only(top: 5),
                          width: double.infinity,
                          child: Text(
                            widget.subTitle!,
                            softWrap: true,
                            maxLines: 4,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: (Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .fontSize! -
                                        1),
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w100),
                            textAlign: widget.isTitleCenter
                                ? TextAlign.center
                                : TextAlign.start,
                          ))
                      : const SizedBox(),
                ],
              ),
              const SizedBox(height: 12),
              widget.content,
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
      actionsAlignment: widget.actionsAlignment,
      actions: [
        widget.onCancel != null && !widget.isLoading
            ? InkWell(
                onTap: widget.onCancel,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    decoration: BoxDecoration(
                      border: widget.cancelButtonBorder,
                      borderRadius: AppBorderRadius.k08,
                      color: widget.cancelButtonColor ?? AppColors.stroke,
                      boxShadow: widget.buttonBoxShadow ?? [],
                    ),
                    child: Text(
                      widget.cancelButtonText ??
                          getTranslated(LangConst.cancel, context).toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: widget.cancelTextcolor ?? AppColors.white,
                          // fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    )),
              )
            : const SizedBox(),
        widget.onOk != null
            ? InkWell(
                onTap: widget.isLoading ? () {} : widget.onOk,
                child: widget.isLoading
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: AppBorderRadius.k08,
                          border: widget.okButtonBorder,
                          color: widget.okButtonColor ?? AppColors.primary,
                          boxShadow: widget.buttonBoxShadow ?? [],
                        ),
                        width: 90,
                        child: const SpinKitFadingCircle(
                          color: Colors.white,
                          size: 22,
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 24),
                        decoration: BoxDecoration(
                          borderRadius: AppBorderRadius.k08,
                          border: widget.okButtonBorder,
                          color: widget.okButtonColor ?? AppColors.primary,
                          boxShadow: widget.buttonBoxShadow ?? [],
                        ),
                        child: Text(
                          widget.okButtonText ??
                              getTranslated(LangConst.ok, context).toString(),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                        ),
                      ))
            : const SizedBox(),
      ],
      actionsPadding: widget.actionsPadding ??
          const EdgeInsets.only(left: 24, right: 34, bottom: 14),
    );
  }
}
