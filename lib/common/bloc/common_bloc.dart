import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:instagram_clone/common/bloc/common_event.dart';
import 'package:instagram_clone/common/models/post.dart';
import 'package:instagram_clone/core/session_details.dart';
import 'package:instagram_clone/utils/constants.dart';

//? For toggling password visibility in textfield
class PasswordBloc extends Bloc<TogglePasswordVisibility, bool> {
  PasswordBloc() : super(true) {
    on<TogglePasswordVisibility>(
      (event, emit) {
        emit(event.isHidden);
      },
    );
  }
}

class LikeBloc extends Bloc<LikeButtonClickedForPost, bool> {
  LikeBloc() : super(false) {
    on<LikeButtonClickedForPost>(
      (event, emit) async {
        final commons = FirebaseFirestore.instance
            .collection(FirebaseDbConstants.commonsCollectionName);
        final commonPostsDocs = (await commons.get()).docs;
        final postToBeLiked = commonPostsDocs
            .firstWhereOrNull((element) => element.id == event.id);
        if (postToBeLiked != null) {
          final post = Post.fromJson(postToBeLiked.data());
          final email = SessionDetails().getUser().profileDetails!.email!;
          if (!event.isLiked) {
            if (!post.likedBy.contains(email)) {
              post.likedBy.add(email);
              await commons.doc(event.id).set(post.toJson());
              emit(true);
            }
          } else if (event.isLiked) {
            bool isPresent = post.likedBy.remove(email);
            if (isPresent) {
              await commons.doc(event.id).set(post.toJson());
              emit(false);
            }
          }
        }
      },
    );
  }
}
