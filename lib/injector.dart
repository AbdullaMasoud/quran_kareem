import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:musilm_app/core/api/api_consumer.dart';
import 'package:musilm_app/core/api/app_interceptor.dart';
import 'package:musilm_app/core/api/dio_consumer.dart';
import 'package:musilm_app/core/network/network_info.dart';
import 'package:musilm_app/features/home_page/data/datasources/pray_time_remote_data_source.dart';
import 'package:musilm_app/features/home_page/data/repositories/get_today_pray_time_repository_impl.dart';
import 'package:musilm_app/features/home_page/domain/repositories/get_today_pray_time_repository.dart';
import 'package:musilm_app/features/home_page/domain/usecases/get_today_pray_time.dart';
import 'package:musilm_app/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:musilm_app/features/misbaha/presentation/cubit/misbaha_cubit.dart';
import 'package:musilm_app/features/quran_main_page/data/datasources/chapter_local_data_source.dart';
import 'package:musilm_app/features/quran_main_page/data/datasources/chapter_remote_data_source.dart';
import 'package:musilm_app/features/quran_main_page/data/repositories/chapters_repository_impl.dart';
import 'package:musilm_app/features/quran_main_page/domain/repositories/chapters_repository.dart';
import 'package:musilm_app/features/quran_main_page/domain/usecases/get_surah_index.dart';
import 'package:musilm_app/features/quran_main_page/presentation/cubit/quran_main_page_cubit.dart';
import 'package:musilm_app/features/surah_details/data/datasources/surah_details_local_data_source.dart';
import 'package:musilm_app/features/surah_details/data/datasources/surah_details_remote_data_source.dart';
import 'package:musilm_app/features/surah_details/data/repositories/get_surah_details_repository_imp.dart';
import 'package:musilm_app/features/surah_details/domain/repositories/get_surah_details_repository.dart';
import 'package:musilm_app/features/surah_details/domain/usecases/get_surah_details.dart';
import 'package:musilm_app/features/surah_details/presentation/cubit/surah_details_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/azkar_details/data/datasources/azkar_local_data_source.dart';
import 'features/azkar_details/data/repositories/azkar_repository_impl.dart';
import 'features/azkar_details/domain/repositories/azkar_repository.dart';
import 'features/azkar_details/domain/usecases/get_azkar.dart';
import 'features/azkar_details/presentation/cubit/azkar_cubit.dart';
import 'features/home_page/presentation/cubit/address_cubit/user_address_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  getIt.registerFactory(() => QuranMainPageCubit(getSurahIndex: getIt()));
  getIt.registerFactory(() => HomePageCubit(getSpecificPrayTime: getIt()));
  getIt.registerFactory(
      () => SurahDetailsCubit(getSurahDetailsUseCase: getIt()));
  getIt.registerFactory(() => AzkarCubit(getAzkar: getIt()));
  getIt.registerFactory(() => MisbahaCubit());
  getIt.registerFactory(() => UserAddressCubit());

  // Use cases
  getIt.registerLazySingleton(() => GetSurahIndex(chaptersRepository: getIt()));

  getIt.registerLazySingleton(
      () => GetSpecificPrayTime(specificPrayTimeRepository: getIt()));

  getIt.registerLazySingleton(
      () => GetSurahDetailsUseCase(getSurahDetailsRepository: getIt()));

  getIt.registerLazySingleton(() => GetAzkar(azkarRepository: getIt()));

  // Repository
  getIt.registerLazySingleton<ChaptersRepository>(() => ChaptersRepositoryImpl(
        networkInfo: getIt(),
        chaptersRemoteDataSource: getIt(),
        chapterLocalDataSource: getIt(),
      ));
  getIt.registerLazySingleton<GetSpecificPrayTimeRepository>(() =>
      GetSpecificPrayTimeRepositoryImpl(
          networkInfo: getIt(), specificPrayTimeRemoteDataSource: getIt()));

  getIt.registerLazySingleton<GetSurahDetailsRepository>(
      () => GetSurahDetailsRepositoryImpl(
            networkInfo: getIt(),
            getSurahDetailsRemoteDataSource: getIt(),
            getSurahDetailsLocalDataSource: getIt(),
          ));
  getIt.registerLazySingleton<AzkarRepository>(
      () => GetAazkarRepositoryImpl(azkarLocalDataSource: getIt()));

  // Data Sources
  getIt.registerLazySingleton<ChaptersRemoteDataSource>(
      () => ChaptersRemoteDataSourceImpl(apiConsumer: getIt()));
  getIt.registerLazySingleton<ChapterLocalDataSource>(
      () => ChapterLocalDataSourceImpl(sharedPreferences: getIt()));

  getIt.registerLazySingleton<SpecificPrayTimeRemoteDataSource>(
      () => SpecificPrayTimeRemoteDataSourceImpl(apiConsumer: getIt()));

  getIt.registerLazySingleton<GetSurahDetailsRemoteDataSource>(
      () => GetSurahDetailsRemoteDataSourceImpl(apiConsumer: getIt()));
  getIt.registerLazySingleton<GetSurahDetailsLocalDataSource>(
      () => GetSurahDetailsLocalDataSourceImpl(sharedPreferences: getIt()));

  getIt.registerLazySingleton<GetAzkarLocalDataSource>(
      () => GetAzkarLocalDataSourceImpl());

  //! Core
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: getIt()));
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: getIt()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
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
