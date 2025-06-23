import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class paymentsOnlineIcons extends StatelessWidget {
  const paymentsOnlineIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          SvgAssets.vodafoneLogo,
          height: 30,
        ),
        SizedBox(width: 10),
        SvgPicture.asset(
          SvgAssets.orangeLogo,
          height: 25,
        ),
        SizedBox(width: 10),
        SvgPicture.asset(
          SvgAssets.etisalatLogo,
          height: 25,
        ),
        SizedBox(width: 5),
        SvgPicture.asset(
          SvgAssets.masterCard,
          height: 25,
        ),
        SizedBox(width: 5),
        SvgPicture.asset(
          SvgAssets.visaYellow,
          height: 25,
        ),
        SizedBox(width: 5),
      ],
    );
  }
}
