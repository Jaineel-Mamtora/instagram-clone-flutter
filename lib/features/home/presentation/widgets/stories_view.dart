import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:instagram_clone/common/widgets/custom_snackbar.dart';
import 'package:instagram_clone/common/widgets/loader.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/home/bloc/home_bloc.dart';
import 'package:instagram_clone/features/home/bloc/home_state.dart';
import 'package:instagram_clone/features/home/presentation/widgets/story_avatar.dart';

class StoriesView extends StatelessWidget {
  const StoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state) {
          case Init():
            return const SizedBox.shrink();
          case StartLoading():
            return const LoaderWidget();
          case StopLoading():
            return const SizedBox.shrink();
          case Done():
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: deviceHeight * 0.016),
              scrollDirection: Axis.horizontal,
              itemCount: state.commonPosts.length,
              itemBuilder:
                  (_, index) => StoryAvatar(
                    index: index,
                    profilePhotoUrl:
                        state.commonPosts[index].postedBy.profilePhotoUrl,
                    username: state.commonPosts[index].postedBy.username,
                  ),
              separatorBuilder:
                  (_, __) => SizedBox(width: deviceHeight * 0.016),
            );
          case Error():
            hideSnackBar();
            showSnackBar(message: state.message);
            return const SizedBox.shrink();
        }
      },
    );
  }
}
