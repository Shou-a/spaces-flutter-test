// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ImageAsIcon extends StatelessWidget {
  String path;
  double size;
  Color? color;
  ImageAsIcon(this.path, {super.key, this.size = 22, this.color});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      color: color,
      height: size,
      width: size,
    );
  }
}
