// هذا الملف للويب فقط
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';

Widget loadSvg(String path, {double? width, double? height, BoxFit fit = BoxFit.cover}) {
  return SvgPicture.network(
    path,
    width: width,
    height: height,
    fit: fit,
  );
}
