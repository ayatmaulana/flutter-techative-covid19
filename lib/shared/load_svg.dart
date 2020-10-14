import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class LoadSvg extends StatelessWidget {
  String assetName;
  double width;
  double height;
  BoxFit fit = BoxFit.fill;

  LoadSvg({this.assetName, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Image.network(assetName, width: width, height: height, fit: fit);
    }

    return SvgPicture.asset(
      assetName,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
