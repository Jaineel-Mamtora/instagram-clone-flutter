import 'package:bloc/bloc.dart';

import 'package:instagram_clone/features/home/domain/usecases/get_paginated_photos_use_case.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_event.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_state.dart';

class SearchPostFeedBloc
    extends Bloc<SearchPostFeedEvent, SearchPostFeedState> {
  final GetPaginatedPhotosUseCase useCase;

  SearchPostFeedBloc(this.useCase) : super(SearchPostFeedInitial()) {
    on<FetchSearchPostFeed>((event, emit) async {
      emit(SearchPostFeedLoading());
      final result = await useCase(event.page);
      emit(SearchPostFeedLoaded(result));
    });
  }
}
