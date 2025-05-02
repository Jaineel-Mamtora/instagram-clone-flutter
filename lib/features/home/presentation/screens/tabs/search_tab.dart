import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:instagram_clone/common/widgets/custom_text_form_field.dart';
import 'package:instagram_clone/common/widgets/loader.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_bloc.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_event.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_state.dart';
import 'package:instagram_clone/features/home/presentation/widgets/custom_post_feed_grid.dart';
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
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
                return const LoaderWidget();
              case SearchPostFeedLoaded():
                return CustomPostFeedGrid(
                  posts: state.posts,
                  isLoading: state.isPaginating,
                  onLoadMore: () {
                    context.read<SearchPostFeedBloc>().add(FetchMorePosts());
                  },
                );
              case SearchPostFeedError():
                return const Center(child: Text('Error Loading feeds'));
            }
          },
        ),
      ),
    );
  }
}
