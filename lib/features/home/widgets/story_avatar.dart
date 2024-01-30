import 'package:flutter/material.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StoryAvatar extends StatelessWidget {
  const StoryAvatar({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: deviceHeight * 0.1,
          width: deviceHeight * 0.1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: MyColors.storiesBorderGradientColors,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: lightTheme.colorScheme.secondary.withOpacity(0.5),
              width: 0.5,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            margin: EdgeInsets.all(deviceHeight * 0.002),
            child: Center(
              child: ClipOval(
                child: Icon(
                  MdiIcons.accountCircle,
                  size: deviceHeight * 0.094,
                  color: lightTheme.colorScheme.secondary.withOpacity(0.3),
                ),
              ),
            ),
            // child: Container(
            //   margin: EdgeInsets.all(deviceHeight * 0.006),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: lightTheme.colorScheme.primary,
            //   ),
            // ),
          ),
        ),
        SizedBox(
          height: deviceHeight * 0.008,
        ),
        SizedBox(
          width: deviceWidth * 0.21,
          child: Center(
            child: Text(
              index == 0 ? 'Your Story' : 'Story $index',
              style: lightTheme.textTheme.labelSmall?.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
