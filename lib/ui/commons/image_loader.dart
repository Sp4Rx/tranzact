import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///This is just an abstraction class of the [SvgPicture] library
///So that this library can be easily changed if needed
class ImageLoader {
  ImageLoader._();

  static Widget asset(
      String assetName, {
        double? height,
        double? width,
        Color? color,
      }) {
    return Image.asset(
      assetName,
      height: height,
      width: width,
      color: color,
    );
  }

  static Widget assetSvg(
    String assetName, {
    double? height,
    double? width,
    Color? color,
  }) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      color: color,
    );
  }

  static Widget networkSvg(
    String assetName, {
    double? height,
    double? width,
    Color? color,
  }) {
    return SvgPicture.network(
      assetName,
      height: height,
      width: width,
      color: color,
      fit: BoxFit.cover,
    );
  }
}

