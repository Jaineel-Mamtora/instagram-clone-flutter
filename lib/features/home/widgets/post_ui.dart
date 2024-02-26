import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:instagram_clone/common/models/post.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';
import 'package:instagram_clone/utils/utility.dart';

class PostUI extends StatelessWidget {
  final Post post;
  const PostUI({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: deviceHeight * 0.01),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: deviceHeight * 0.01,
                  horizontal: deviceWidth * 0.04,
                ),
                child: ClipOval(
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: post.postedBy.profilePhotoUrl!,
                      height: deviceHeight * 0.05,
                      alignment: Alignment.topCenter,
                      placeholder: (_, __) {
                        return Icon(
                          MdiIcons.accountCircle,
                          size: deviceHeight * 0.05,
                          color:
                              lightTheme.colorScheme.secondary.withOpacity(0.3),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Text(
                post.postedBy.username ?? 'username',
                style: lightTheme.textTheme.labelLarge,
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_rounded,
                  size: deviceWidth * 0.06,
                  color: lightTheme.colorScheme.secondary,
                ),
              ),
            ],
          ),
          Container(
            constraints: BoxConstraints(maxHeight: deviceHeight * 0.5),
            child: CachedNetworkImage(
              imageUrl: post.imageUrls.first,
              width: deviceWidth,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              placeholder: (_, __) => Container(
                constraints: BoxConstraints(maxHeight: deviceHeight * 0.5),
                color: lightTheme.colorScheme.onPrimary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: deviceHeight * 0.01,
              horizontal: deviceWidth * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: deviceWidth * 0.03),
                      child: IconButton(
                        style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          Constants.pathToLikeUnselectedLightThemeSvg,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: deviceWidth * 0.03),
                      child: IconButton(
                        style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          Constants.pathToCommentLightTheme,
                        ),
                      ),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Constants.pathToShareLightTheme,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Constants.pathToSaveLightTheme,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: deviceHeight * 0.008,
                    bottom: deviceHeight * 0.005,
                  ),
                  child: Text(
                    '502 likes',
                    style: lightTheme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '${post.postedBy.username ?? 'username'} ',
                    style: lightTheme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: post.postContent ?? '.',
                        style: lightTheme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: deviceHeight * 0.005,
                  ),
                  child: Text(
                    Utility.formatDateTimeAgo(post.createdOn),
                    style: lightTheme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: lightTheme.colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
