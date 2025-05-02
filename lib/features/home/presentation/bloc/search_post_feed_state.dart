import 'package:instagram_clone/features/home/domain/entities/search_post.dart';

sealed class SearchPostFeedState {}

class SearchPostFeedInitial extends SearchPostFeedState {}

class SearchPostFeedLoading extends SearchPostFeedState {}

class SearchPostFeedLoaded extends SearchPostFeedState {
  final List<SearchPost> posts;
  SearchPostFeedLoaded(this.posts);
}

class SearchPostFeedError extends SearchPostFeedState {
  final String message;
  SearchPostFeedError(this.message);
}
