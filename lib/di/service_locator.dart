import 'package:get_it/get_it.dart';

import 'package:instagram_clone/core/network/dio_client.dart';
import 'package:instagram_clone/env/env.dart';
import 'package:instagram_clone/features/home/data/datasources/home_remote_datasource.dart';
import 'package:instagram_clone/features/home/data/repository/photos_repository_impl.dart';
import 'package:instagram_clone/features/home/domain/repository/photos_repository.dart';
import 'package:instagram_clone/features/home/domain/usecases/get_paginated_photos_use_case.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(() => DioClient(baseUrl: Env.unsplashApiBaseUrl));
  sl.registerLazySingleton(() => sl<DioClient>().dio);

  // Data Layer
  sl.registerLazySingleton<HomeRemoteDatasource>(
    () => HomeRemoteDatasource(dio: sl()),
  );
  sl.registerLazySingleton<PhotosRepository>(
    () => PhotosRepositoryImpl(homeRemoteDatasource: sl()),
  );

  // Domain Layer
  sl.registerLazySingleton(() => GetPaginatedPhotosUseCase(sl()));

  // Presentation Layer
  sl.registerFactory(() => SearchPostFeedBloc(sl()));
}
