import 'package:bloc/bloc.dart';

import 'package:instagram_clone/features/home/domain/usecases/get_paginated_photos_use_case.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_event.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_state.dart';

class SearchPostFeedBloc
    extends Bloc<SearchPostFeedEvent, SearchPostFeedState> {
  final GetPaginatedPhotosUseCase getPaginatedPhotos;

  SearchPostFeedBloc(this.getPaginatedPhotos) : super(SearchPostFeedInitial()) {
    on<FetchInitialPosts>(_onInitialFetch);
    on<FetchMorePosts>(_onFetchMore);
  }

  Future<void> _onInitialFetch(
    FetchInitialPosts event,
    Emitter<SearchPostFeedState> emit,
  ) async {
    emit(SearchPostFeedLoading());
    try {
      final posts = await getPaginatedPhotos(1);
      emit(SearchPostFeedLoaded(posts: posts, page: 1));
    } catch (e) {
      emit(SearchPostFeedError('Failed to load posts'));
    }
  }

  Future<void> _onFetchMore(
    FetchMorePosts event,
    Emitter<SearchPostFeedState> emit,
  ) async {
    if (state is SearchPostFeedLoaded) {
      final currentState = state as SearchPostFeedLoaded;

      if (currentState.isPaginating) return; // Prevent double-fetch

      emit(currentState.copyWith(isPaginating: true));
      try {
        final newPosts = await getPaginatedPhotos(currentState.page + 1);
        final combined = [...currentState.posts, ...newPosts];
        emit(
          SearchPostFeedLoaded(posts: combined, page: currentState.page + 1),
        );
      } catch (e) {
        emit(SearchPostFeedError('Failed to load more posts'));
      }
    }
  }
}
