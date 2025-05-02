import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'UNSPLASH_API_BASE_URL', obfuscate: true)
  static final String unsplashApiBaseUrl = _Env.unsplashApiBaseUrl;

  @EnviedField(varName: 'UNSPLASH_AUTH_TOKEN', obfuscate: true)
  static final String unsplashAuthToken = _Env.unsplashAuthToken;
}
