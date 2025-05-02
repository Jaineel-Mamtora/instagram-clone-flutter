import 'package:dio/dio.dart';

import 'package:instagram_clone/features/home/data/models/search_post_model.dart';
import 'package:instagram_clone/features/home/domain/entities/search_post.dart';

class HomeRemoteDatasource {
  final Dio dio;

  const HomeRemoteDatasource({required this.dio});

  Future<List<SearchPost>> fetchPaginatedListOfPhotos(int pageId) async {
    final response = await dio.get('/photos');
    final data = response.data as List;

    final posts =
        data.map((json) => SearchPostModel.fromJson(json).toEntity()).toList();

    return posts;
  }
}
