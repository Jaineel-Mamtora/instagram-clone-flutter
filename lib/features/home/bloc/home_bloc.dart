import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

import 'package:instagram_clone/common/models/post.dart';
import 'package:instagram_clone/features/home/bloc/home_event.dart';
import 'package:instagram_clone/features/home/bloc/home_state.dart';
import 'package:instagram_clone/utils/constants.dart';

class TabBloc extends Bloc<ChangeHomeTabIndex, int> {
  TabBloc() : super(0) {
    on<ChangeHomeTabIndex>((event, emit) {
      emit(event.index);
    });
  }
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(Init()) {
    on<FetchCommonPosts>((event, emit) async {
      try {
        final commons = FirebaseFirestore.instance
            .collection(FirebaseDbConstants.commonsCollectionName);
        final commonPostsDocs = (await commons.get()).docs;
        var commonPosts = <Post>[];
        for (var element in commonPostsDocs) {
          commonPosts.add(Post.fromJson(element.data()));
        }
        emit(Done(commonPosts: commonPosts));
      } catch (e) {
        emit(Error(message: e.toString()));
        Logger().e(e);
      }
    });
  }
}
