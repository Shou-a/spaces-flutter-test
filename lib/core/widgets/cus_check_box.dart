import 'package:flutter/material.dart';

class CusCheckBox extends StatefulWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final String? leftLabel;
  final String? rightLabel;
  final TextStyle? labelStyle;
  final bool isSpaceBetweenLableAndCheck;
  final Color textColor;
  final bool alignLabelTop;

  const CusCheckBox(
      {super.key,
      required this.value,
      this.onChanged,
      this.leftLabel,
      this.rightLabel,
      this.labelStyle,
      this.isSpaceBetweenLableAndCheck = false,
      this.textColor = Colors.black,
      this.alignLabelTop = false});

  @override
  State<CusCheckBox> createState() => _CusCheckBoxState();
}

class _CusCheckBoxState extends State<CusCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onChanged != null) {
          widget
              .onChanged!(!widget.value); // Toggle the value and call onChanged
        }
      },
      child: Row(
        mainAxisAlignment: widget.isSpaceBetweenLableAndCheck
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        crossAxisAlignment: widget.alignLabelTop
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          if (widget.leftLabel != null)
            Flexible(
                fit: FlexFit.loose,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "•  ",
                        style: widget.labelStyle,
                      ),
                      Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            widget.leftLabel!,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 2,
                            style: widget.labelStyle,
                          )),
                    ])),
          Checkbox(
            value: widget.value,
            onChanged: null,
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.transparent;
              }
              return Colors.transparent;
            }),
            checkColor: widget.textColor,
            activeColor: widget.textColor,
            overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
              return widget.textColor;
            }),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.5)),
            ),
            side: MaterialStateBorderSide.resolveWith((states) => BorderSide(
                color: widget.textColor,
                width: 2.0,
                strokeAlign: BorderSide.strokeAlignCenter)),
          ),
          if (widget.rightLabel != null)
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  widget.rightLabel!,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,
                  style: widget.labelStyle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
