import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:instagram_clone/utils/constants.dart';

class MetaLogoFooter extends StatelessWidget {
  const MetaLogoFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: media.size.height * (16 / media.size.height),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Constants.pathToMetaLogoSvg,
            height: media.size.height * (12 / media.size.height),
          ),
        ],
      ),
    );
  }
}
