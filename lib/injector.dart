import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:musilm_app/core/api/api_consumer.dart';
import 'package:musilm_app/core/api/app_interceptor.dart';
import 'package:musilm_app/core/api/dio_consumer.dart';
import 'package:musilm_app/core/network/network_info.dart';
import 'package:musilm_app/features/quran_main_page/data/datasources/chapter_remote_data_source.dart';
import 'package:musilm_app/features/quran_main_page/data/repositories/chapters_repository_impl.dart';
import 'package:musilm_app/features/quran_main_page/domain/repositories/chapters_repository.dart';
import 'package:musilm_app/features/quran_main_page/domain/usecases/get_surah_index.dart';
import 'package:musilm_app/features/quran_main_page/presentation/cubit/quran_main_page_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  getIt.registerFactory(() => QuranMainPageCubit(getSurahIndex: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetSurahIndex(chaptersRepository: getIt()));

  // Repository
  getIt.registerLazySingleton<ChaptersRepository>(() => ChaptersRepositoryImpl(
        networkInfo: getIt(),
        chaptersRemoteDataSource: getIt(),
      ));

  // Data Sources
  getIt.registerLazySingleton<ChaptersRemoteDataSource>(
      () => ChaptersRemoteDataSourceImpl(apiConsumer: getIt()));

  //! Core
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: getIt()));
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: getIt()));

  //! External
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(() => AppIntercepters());
  getIt.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
  getIt.registerLazySingleton(() => Dio());
}
