import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:instagram_clone/features/home/domain/entities/search_post.dart';

class CustomPostFeedGrid extends StatelessWidget {
  final List<SearchPost> posts;

  const CustomPostFeedGrid({required this.posts});

  @override
  Widget build(BuildContext context) {
    const groupSize = 5;

    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: List.generate(posts.length, (index) {
          final groupIndex = index ~/ groupSize;
          final positionInGroup = index % groupSize;
          final isMirrored = groupIndex % 2 == 1;

          // Determine layout pattern:
          bool isTall = false;

          if (isMirrored) {
            // Tall tile is at position 0 in mirrored group
            isTall = positionInGroup == 0;
          } else {
            // Tall tile is at position 2 in normal group
            isTall = positionInGroup == 2;
          }

          return StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: isTall ? 2 : 1,
            child: CachedNetworkImage(
              imageUrl: posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        }),
      ),
    );
  }
}
