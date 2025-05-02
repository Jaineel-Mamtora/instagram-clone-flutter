import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:instagram_clone/common/widgets/custom_text_form_field.dart';
import 'package:instagram_clone/features/home/domain/entities/search_post.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_bloc.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_state.dart';
import 'package:instagram_clone/utils/constants.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder:
            (_, _) => [
              SliverAppBar(
                snap: true,
                floating: true,
                automaticallyImplyLeading: false,
                surfaceTintColor: Colors.transparent,
                centerTitle: false,
                title: CustomTextFormField(
                  filled: true,
                  hasBorder: false,
                  fillColor: MyColors.fillColor,
                  size: InputSize.small,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(
                      Constants.pathToSearchUnselectedLightThemeSvg,
                    ),
                  ),
                  validator: (_) => null,
                  controller: _searchController,
                  hintText: 'Search',
                ),
              ),
            ],
        body: BlocBuilder<SearchPostFeedBloc, SearchPostFeedState>(
          builder: (context, state) {
            switch (state) {
              case SearchPostFeedInitial():
              case SearchPostFeedLoading():
                return const Center(child: CircularProgressIndicator());
              case SearchPostFeedLoaded():
                return InstagramLikeGrid(posts: state.posts);
              case SearchPostFeedError():
                return const Center(child: Text('Error Loading feeds'));
            }
          },
        ),
      ),
    );
  }
}

class InstagramLikeGrid extends StatelessWidget {
  final List<SearchPost> posts;

  const InstagramLikeGrid({required this.posts});

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
