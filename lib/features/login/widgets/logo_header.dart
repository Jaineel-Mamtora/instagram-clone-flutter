import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:instagram_clone/utils/constants.dart';

class InstagramLogoHeader extends StatelessWidget {
  const InstagramLogoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return SvgPicture.asset(
      Constants.pathToInstagramLogoSvg,
      height: media.size.height * (60 / media.size.height),
    );
  }
}
