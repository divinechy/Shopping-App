// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlatformSvg {
  static Widget asset(
    String assetName, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
    Alignment alignment = Alignment.center,
    String? semanticsLabel,
    GestureTapCallback? onTap,
  }) {
    Widget svg = SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
      semanticsLabel: semanticsLabel,
    );

    return GestureDetector(onTap: onTap ?? () {}, child: svg);
  }
}
