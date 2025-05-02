import 'package:dio/dio.dart';
import 'package:instagram_clone/env/env.dart';

class DioClient {
  final Dio _dio;

  DioClient({
    required String baseUrl,
    Map<String, String>? headers,
    Interceptors? customInterceptors,
  }) : _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: headers)) {
    _dio.interceptors.add(
      LogInterceptor(responseBody: true, requestBody: true),
    );

    if (customInterceptors != null) {
      _dio.interceptors.addAll(customInterceptors);
    }

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Client-ID ${Env.unsplashAuthToken}';
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            // Handle token refresh logic here
          }
          return handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
