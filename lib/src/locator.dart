import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'config/router/app_router.dart';
import 'data/datasources/remote/skipper_api_service.dart';
import 'data/repositories/api_repository_impl.dart';
import 'domain/respositories/skipper_api_repository.dart';
import 'utils/auth_service.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  const secureStorage = FlutterSecureStorage();

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<FlutterSecureStorage>(secureStorage);

  locator.registerSingleton<AuthService>(
      AuthService(locator<FlutterSecureStorage>()));

  locator.registerSingleton<SkipperApiService>(
    SkipperApiService(locator<Dio>()),
  );

  locator.registerSingleton<SkipperApiRepository>(
    ApiRepositoryImpl(locator<SkipperApiService>()),
  );

  locator.registerSingleton<AppRouter>(AppRouter());
}
