import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/utils/constants.dart';

class InstagramLogoHeader extends StatelessWidget {
  const InstagramLogoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Constants.pathToInstagramLogoSvg,
      height: deviceHeight * 0.09,
    );
  }
}
