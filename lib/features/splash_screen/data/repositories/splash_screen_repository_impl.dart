import '../../domain/repositories/splash_screen_repository.dart';

class SplashScreenRepositoryImpl implements SplashScreenRepository {
  const SplashScreenRepositoryImpl();

  Future<T> _run<T>(Future<T> Function() function) async {
    try {
      return await function();
    } catch (e) {
      throw e;
    }
  }
}
