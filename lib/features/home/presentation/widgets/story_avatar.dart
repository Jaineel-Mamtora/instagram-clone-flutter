import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class StoryAvatar extends StatelessWidget {
  const StoryAvatar({
    required this.index,
    super.key,
    required this.profilePhotoUrl,
    required this.username,
  });

  final int index;
  final String? profilePhotoUrl;
  final String? username;

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
              color: lightTheme.colorScheme.secondary.withValues(alpha: 0.5),
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
                child: CachedNetworkImage(
                  imageUrl: profilePhotoUrl ?? '',
                  height: deviceHeight * 0.082,
                  placeholder:
                      (_, __) => Icon(
                        MdiIcons.accountCircle,
                        size: deviceHeight * 0.082,
                        color: lightTheme.colorScheme.secondary.withValues(
                          alpha: 0.3,
                        ),
                      ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: deviceHeight * 0.008),
        SizedBox(
          width: deviceWidth * 0.21,
          child: Center(
            child: Text(
              index == 0 ? 'Your Story' : username ?? 'username',
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
