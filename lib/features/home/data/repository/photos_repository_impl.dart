import 'package:instagram_clone/features/home/data/datasources/home_remote_datasource.dart';
import 'package:instagram_clone/features/home/domain/entities/search_post.dart';
import 'package:instagram_clone/features/home/domain/repository/photos_repository.dart';

class PhotosRepositoryImpl implements PhotosRepository {
  final HomeRemoteDatasource homeRemoteDatasource;

  const PhotosRepositoryImpl({required this.homeRemoteDatasource});

  @override
  Future<List<SearchPost>> getPaginatedListOfPhotos({
    required int pageId,
  }) async {
    return await homeRemoteDatasource.fetchPaginatedListOfPhotos(pageId);
  }
}
