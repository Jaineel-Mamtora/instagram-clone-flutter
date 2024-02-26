import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:instagram_clone/common/widgets/custom_snackbar.dart';
import 'package:instagram_clone/common/widgets/loader.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/home/bloc/home_bloc.dart';
import 'package:instagram_clone/features/home/bloc/home_state.dart';
import 'package:instagram_clone/features/home/widgets/post_ui.dart';
import 'package:instagram_clone/features/home/widgets/story_avatar.dart';
import 'package:instagram_clone/my_theme.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: deviceHeight * 0.15,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                switch (state) {
                  case Init():
                    return const SizedBox.shrink();
                  case StartLoading():
                    return LoaderWidget();
                  case StopLoading():
                    LoaderManager().hideLoader();
                    return const SizedBox.shrink();
                  case Done():
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: deviceHeight * 0.016,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.commonPosts.length,
                      itemBuilder: (_, index) => StoryAvatar(
                        index: index,
                        profilePhotoUrl:
                            state.commonPosts[index].postedBy.profilePhotoUrl,
                        username: state.commonPosts[index].postedBy.username,
                      ),
                      separatorBuilder: (_, __) => SizedBox(
                        width: deviceHeight * 0.016,
                      ),
                    );
                  case Error():
                    hideSnackBar();
                    showSnackBar(message: state.message);
                    return const SizedBox.shrink();
                }
              },
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: lightTheme.colorScheme.secondary.withOpacity(0.2),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              switch (state) {
                case Init():
                  return const SizedBox.shrink();
                case StartLoading():
                  return LoaderWidget();
                case StopLoading():
                  LoaderManager().hideLoader();
                  return const SizedBox.shrink();
                case Done():
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.commonPosts.length,
                    itemBuilder: (_, index) {
                      return PostUI(post: state.commonPosts[index]);
                    },
                  );
                case Error():
                  hideSnackBar();
                  showSnackBar(message: state.message);
                  return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
