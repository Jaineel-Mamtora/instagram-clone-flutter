import 'package:flutter/material.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/home/widgets/story_avatar.dart';
import 'package:instagram_clone/my_theme.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: deviceHeight * 0.15,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: deviceHeight * 0.016,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (_, index) => StoryAvatar(index: index),
              separatorBuilder: (_, __) => SizedBox(
                width: deviceHeight * 0.016,
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: lightTheme.colorScheme.secondary.withOpacity(0.2),
          ),
          ListView.builder(
            itemCount: 10,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                color: (index % 2 != 0)
                    ? lightTheme.colorScheme.primary
                    : Colors.white,
              );
            },
          ),
        ],
      ),
    );
  }
}
