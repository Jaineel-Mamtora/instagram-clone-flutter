abstract class SearchPostFeedEvent {}

class FetchSearchPostFeed extends SearchPostFeedEvent {
  final int page;
  FetchSearchPostFeed(this.page);
}
