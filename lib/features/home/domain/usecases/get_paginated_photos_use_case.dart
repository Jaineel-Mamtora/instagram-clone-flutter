import 'package:instagram_clone/features/home/domain/entities/search_post.dart';
import 'package:instagram_clone/features/home/domain/repository/photos_repository.dart';

class GetPaginatedPhotosUseCase {
  final PhotosRepository repository;

  GetPaginatedPhotosUseCase(this.repository);

  Future<List<SearchPost>> call(int pageId) {
    return repository.getPaginatedListOfPhotos(pageId: pageId);
  }
}
