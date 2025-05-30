// هذا الملف للموبايل والديسكتوب فقط
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';

Widget loadSvg(String path, {double? width, double? height, BoxFit fit = BoxFit.cover}) {
  return SvgPicture.file(
    File(path),
    width: width,
    height: height,
    fit: fit,
  );
}
