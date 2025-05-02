import 'package:instagram_clone/features/home/domain/entities/search_post.dart';

abstract class PhotosRepository {
  Future<List<SearchPost>> getPaginatedListOfPhotos({required int pageId});
}
