import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/remote/skipper_api_service.dart';
import 'data/repositories/api_repository_impl.dart';
import 'domain/respositories/skipper_api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<SkipperApiService>(
    SkipperApiService(locator<Dio>()),
  );

  locator.registerSingleton<SkipperApiRepository>(
    ApiRepositoryImpl(locator<SkipperApiService>()),
  );
}
