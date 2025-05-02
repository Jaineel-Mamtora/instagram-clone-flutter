import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:instagram_clone/common/widgets/custom_snackbar.dart';
import 'package:instagram_clone/common/widgets/loader.dart';
import 'package:instagram_clone/features/home/bloc/home_bloc.dart';
import 'package:instagram_clone/features/home/bloc/home_state.dart';
import 'package:instagram_clone/features/home/presentation/widgets/post_ui.dart';

class CommonPostsView extends StatelessWidget {
  const CommonPostsView({super.key});

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
    );
  }
}
