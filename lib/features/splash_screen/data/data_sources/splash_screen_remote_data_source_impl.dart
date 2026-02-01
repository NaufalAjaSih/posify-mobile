import 'splash_screen_remote_data_source.dart';

class SplashScreenRemoteDataSourceImpl implements SplashScreenRemoteDataSource {
  const SplashScreenRemoteDataSourceImpl();

  Future<T> _run<T>(Future<T> Function() function) async {
    try {
      return await function();
    } catch (e) {
      throw e;
    }
  }
}
