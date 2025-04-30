import 'package:flutter/material.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/home/widgets/common_posts_view.dart';
import 'package:instagram_clone/features/home/widgets/stories_view.dart';
import 'package:instagram_clone/my_theme.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
