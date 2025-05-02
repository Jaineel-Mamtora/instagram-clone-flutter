import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:instagram_clone/features/home/domain/entities/search_post.dart';

class CustomPostFeedGrid extends StatefulWidget {
  final List<SearchPost> posts;
  final VoidCallback onLoadMore;
  final bool isLoading;

  const CustomPostFeedGrid({
    required this.posts,
    required this.onLoadMore,
    required this.isLoading,
  });

  @override
  State<CustomPostFeedGrid> createState() => _CustomPostFeedGridState();
}

class _CustomPostFeedGridState extends State<CustomPostFeedGrid> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll - 150 && !widget.isLoading) {
      widget.onLoadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const groupSize = 5;

    return SingleChildScrollView(
      controller: _scrollController,
      child: StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: [
          ...List.generate(widget.posts.length, (index) {
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
                imageUrl: widget.posts[index].imageUrl,
                fit: BoxFit.cover,
              ),
            );
          }),
          if (widget.isLoading)
            StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 1,
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
