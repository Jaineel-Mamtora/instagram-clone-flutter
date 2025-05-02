import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:instagram_clone/common/widgets/custom_text_form_field.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_bloc.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_state.dart';
import 'package:instagram_clone/my_theme.dart';
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
                return GridView.builder(
                  itemCount: state.posts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      key: Key(state.posts[index].id),
                      imageUrl: state.posts[index].imageUrl,
                      fit: BoxFit.cover,
                    );
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
