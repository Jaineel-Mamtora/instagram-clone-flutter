import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/utils/constants.dart';

class MetaLogoFooter extends StatelessWidget {
  const MetaLogoFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: deviceHeight * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Constants.pathToMetaLogoSvg,
            height: deviceHeight * 0.015,
          ),
        ],
      ),
    );
  }
}
