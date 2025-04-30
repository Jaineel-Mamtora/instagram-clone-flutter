import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/home/widgets/common_posts_view.dart';
import 'package:instagram_clone/features/home/widgets/stories_view.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder:
            (_, __) => [
              SliverAppBar(
                bottom: PreferredSize(
                  preferredSize: Size(deviceWidth, 1),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: lightTheme.colorScheme.secondary.withValues(
                      alpha: 0.2,
                    ),
                  ),
                ),
                snap: true,
                floating: true,
                automaticallyImplyLeading: false,
                surfaceTintColor: Colors.transparent,
                centerTitle: false,
                title: Text(
                  Constants.appName,
                  style: lightTheme.textTheme.displayLarge,
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    tooltip: Constants.notifications,
                    icon: SvgPicture.asset(
                      Constants.pathToLikeUnselectedLightThemeSvg,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    tooltip: Constants.messages,
                    icon: SvgPicture.asset(
                      Constants.pathToMessengerLightThemeSvg,
                    ),
                  ),
                ],
              ),
            ],
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: deviceHeight * 0.15, child: StoriesView()),
              Divider(
                height: 1,
                thickness: 1,
                color: lightTheme.colorScheme.secondary.withValues(alpha: 0.2),
              ),
              CommonPostsView(),
            ],
          ),
        ),
      ),
    );
  }
}
