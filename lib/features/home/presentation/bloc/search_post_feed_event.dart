import 'package:equatable/equatable.dart';

sealed class SearchPostFeedEvent extends Equatable {
  const SearchPostFeedEvent();
}

final class FetchInitialPosts extends SearchPostFeedEvent {
  final int page;
  const FetchInitialPosts(this.page);

  @override
  List<Object?> get props => [page];
}

final class FetchMorePosts extends SearchPostFeedEvent {
  const FetchMorePosts();

  @override
  List<Object?> get props => [];
}
