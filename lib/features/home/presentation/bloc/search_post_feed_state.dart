import 'package:equatable/equatable.dart';

import 'package:instagram_clone/features/home/domain/entities/search_post.dart';

sealed class SearchPostFeedState extends Equatable {
  const SearchPostFeedState();
}

final class SearchPostFeedInitial extends SearchPostFeedState {
  const SearchPostFeedInitial();

  @override
  List<Object?> get props => [];
}

final class SearchPostFeedLoading extends SearchPostFeedState {
  const SearchPostFeedLoading();

  @override
  List<Object?> get props => [];
}

final class SearchPostFeedLoaded extends SearchPostFeedState {
  const SearchPostFeedLoaded({
    required this.posts,
    required this.page,
    this.isPaginating = false,
  });

  final List<SearchPost> posts;
  final int page;
  final bool isPaginating;

  SearchPostFeedLoaded copyWith({
    List<SearchPost>? posts,
    int? page,
    bool? isPaginating,
  }) {
    return SearchPostFeedLoaded(
      posts: posts ?? this.posts,
      page: page ?? this.page,
      isPaginating: isPaginating ?? this.isPaginating,
    );
  }

  @override
  List<Object?> get props => [posts, page, isPaginating];
}

final class SearchPostFeedError extends SearchPostFeedState {
  const SearchPostFeedError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
