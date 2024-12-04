import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CusTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final int? maxLine;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final bool? autoFocus;
  final TextInputAction? textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String? validatorMessage;
  final Color? fillColor;
  final TextCapitalization capitalization;
  final bool isBorder;
  final TextAlign? textAlign;
  final bool isEnable;
  final double cursorWidth;
  final String? labelText;
  final Function(String?)? onChanged;
  final bool? readOnly;
  final List<FilteringTextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? cursorColor;
  final Color? lableColors;
  final Color? floatingLableColors;
  final FormFieldValidator<String>? customValidator;
  final bool? alignLabelWithHint;
  final TextStyle? labelStyle;
  final Function(String)? onFieldSubmitted;

  const CusTextField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputType,
    this.maxLine,
    this.focusNode,
    this.nextNode,
    this.autoFocus = false,
    this.textInputAction,
    this.isPhoneNumber = false,
    this.isValidator = false,
    this.validatorMessage,
    this.capitalization = TextCapitalization.none,
    this.fillColor,
    this.isBorder = false,
    this.textAlign,
    this.isEnable = true,
    this.cursorWidth = 1.5,
    this.labelText,
    this.onChanged,
    this.readOnly,
    this.inputFormatters,
    this.obscureText,
    this.borderColor,
    this.focusBorderColor,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.textStyle,
    this.hintStyle,
    this.cursorColor,
    this.lableColors,
    this.floatingLableColors,
    this.customValidator,
    this.alignLabelWithHint,
    this.labelStyle,
    this.onFieldSubmitted,
  });

  @override
  CusTextFieldState createState() => CusTextFieldState();
}

class CusTextFieldState extends State<CusTextField> {
  late FocusNode _focusNode;
  Color _borderColor = Colors.grey;
  Color _iconColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _borderColor = _focusNode.hasFocus
            ? (widget.focusBorderColor ?? Colors.black)
            : (widget.borderColor ?? Colors.grey);
        _iconColor = _focusNode.hasFocus
            ? (widget.focusBorderColor ?? Colors.black)
            : (widget.borderColor ?? Colors.grey);
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        obscureText: widget.obscureText ?? false,
        style: widget.textStyle,
        onChanged: widget.onChanged,
        cursorWidth: widget.cursorWidth,
        autofocus: widget.autoFocus ?? false,
        textAlign: widget.textAlign ?? TextAlign.start,
        controller: widget.controller,
        maxLines: (widget.maxLine == -1) ? null : (widget.maxLine ?? 1),
        textCapitalization: widget.capitalization,
        maxLength: widget.maxLength ?? (widget.isPhoneNumber ? 18 : null),
        focusNode: _focusNode,
        keyboardType: widget.textInputType ?? TextInputType.text,
        enabled: widget.isEnable,
        initialValue: null,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (widget.textInputAction == TextInputAction.newline)
            ? null
            : (widget.onFieldSubmitted ??
                (v) {
                  FocusScope.of(context).requestFocus(widget.nextNode);
                }),
        inputFormatters: widget.inputFormatters ??
            (widget.isPhoneNumber
                ? [FilteringTextInputFormatter.digitsOnly]
                : null),
        validator: widget.customValidator ??
            (input) {
              if (input == null || input.isEmpty) {
                if (widget.isValidator) {
                  return widget.validatorMessage ?? "";
                }
              }
              return null;
            },
        readOnly: widget.readOnly ?? false,
        cursorColor: AppColors.subText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: widget.fillColor != null,
          fillColor: widget.fillColor ?? AppColors.transparent,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15),
          isDense: true,
          counterText: '',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: _borderColor),
          ),
          hintStyle:
              widget.hintStyle ?? TextStyle(color: _iconColor, fontSize: 13),
          errorStyle: const TextStyle(height: 1.5),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: _borderColor),
          ),
          suffixIcon: widget.suffixIcon != null
              ? IconTheme(
                  data: IconThemeData(color: _iconColor),
                  child: widget.suffixIcon!)
              : null,
          prefixIcon: widget.prefixIcon != null
              ? IconTheme(
                  data: IconThemeData(color: _iconColor),
                  child: widget.prefixIcon!)
              : null,
        ),
      ),
    );
  }
}
