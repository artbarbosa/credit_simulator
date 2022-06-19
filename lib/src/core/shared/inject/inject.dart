import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../services/remote/dio_http_client_service.dart';
import '../services/remote/http_client_service.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.I;

    getIt.registerLazySingleton<IHttpClientService>(
        () => DioHttpServiceImp(Dio()));

    // getIt.registerLazySingleton<IHttpClientService>(
    //     () => GraphqlHttpClientServiceImp(getIt()));

    // getIt.registerLazySingleton<IBookRemoteDataSource>(
    //     () => BookRemoteDataSource(client: getIt()));

    // getIt.registerLazySingleton<IAuthorRemoteDataSource>(
    //     () => AuthorRemoteDataSource(client: getIt()));

    // getIt.registerLazySingleton<IUserRemoteDataSource>(
    //     () => UserRemoteDataSource(client: getIt()));

    // getIt.registerLazySingleton<IBookRepository>(
    //     () => BookRepository(datasource: getIt()));

    // getIt.registerLazySingleton<IAuthorRepository>(
    //     () => AuthorRepository(datasource: getIt()));

    // getIt.registerLazySingleton<IUserRepository>(
    //     () => UserRepository(datasource: getIt()));

    // getIt.registerLazySingleton<MyBooksController>(
    //   () => MyBooksController(getIt(), getIt()),
    // );

    // getIt.registerFactory<DetailController>(
    //   () => DetailController(getIt()),
    // );

    // getIt.registerFactory<HomeController>(
    //   () => HomeController(getIt()),
    // );

    // getIt.registerLazySingleton<CustomBottomNavigationBarController>(
    //   () => CustomBottomNavigationBarController(0),
    // );
  }
}
