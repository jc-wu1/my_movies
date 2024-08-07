import 'package:get_it/get_it.dart';

import '../../features/authentication/data/datasource/authentication_local_data_source.dart';
import '../../features/authentication/data/repository/authentication_repository_impl.dart';
import '../../features/authentication/domain/repository/authentication_repository.dart';
import '../../features/authentication/domain/usecase/delete_auth_data.dart';
import '../../features/authentication/domain/usecase/get_auth_token.dart';
import '../../features/authentication/domain/usecase/has_auth_token.dart';
import '../../features/authentication/domain/usecase/save_auth_token.dart';
import '../../features/favorites/data/datasource/favorites_local_data_source.dart';
import '../../features/favorites/data/repository/favorites_repository_impl.dart';
import '../../features/favorites/domain/repository/favorites_repository.dart';
import '../../features/favorites/domain/usecases/add_favorite_item_usecase.dart';
import '../../features/favorites/domain/usecases/check_if_favorite_item_added_usecase.dart';
import '../../features/favorites/domain/usecases/get_favorite_items_usecase.dart';
import '../../features/favorites/domain/usecases/remove_favorite_item_usecase.dart';
import '../../features/movies/data/datasource/movies_remote_data_source.dart';
import '../../features/movies/data/repository/movies_repository_impl.dart';
import '../../features/movies/domain/repository/movies_repository.dart';
import '../../features/movies/domain/usecases/get_all_popular_movies_usecase.dart';
import '../../features/movies/domain/usecases/get_all_top_rated_movies_usecase.dart';
import '../../features/movies/domain/usecases/get_movie_details_usecase.dart';
import '../../features/movies/domain/usecases/get_movies_usecase.dart';
import '../../features/movies/presentation/blocs/movies_bloc/movies_bloc.dart';
import '../../features/movies/presentation/blocs/popular_movies_bloc/popular_movies_bloc.dart';
import '../../features/movies/presentation/blocs/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import '../../features/watchlist/data/datasource/watchlist_local_data_source.dart';
import '../../features/watchlist/data/repository/watchlist_repository_impl.dart';
import '../../features/watchlist/domain/repository/watchlist_repository.dart';
import '../../features/watchlist/domain/usecases/add_watchlist_item_usecase.dart';
import '../../features/watchlist/domain/usecases/check_if_watchlist_item_added_usecase.dart';
import '../../features/watchlist/domain/usecases/get_watchlist_items_usecase.dart';
import '../../features/watchlist/domain/usecases/remove_watchlist_item_usecase.dart';
import '../database/isar_db.dart';
import '../database/isar_db_impl.dart';

final sl = GetIt.instance;

/// Initializes the database and registers it with the service locator.
///
/// This function sets up the [IsarDb] instance and ensures that the
/// database is properly initialized. It registers [IsarDb] as a
/// lazy singleton in the service locator [GetIt] instance.
///
/// This should be called before accessing any other dependencies
/// that rely on the database.
Future<void> initDb() async {
  // Register the database implementation.
  sl.registerLazySingleton<IsarDb>(() => IsarDbImpl());
  // Initialize the database.
  await sl<IsarDb>().initDb();
}

/// The `Injector` class is responsible for configuring and registering
/// all dependencies in the service locator [GetIt].
///
/// This class uses the [GetIt] service locator to manage dependency
/// injection for various components of the application, including data
/// sources, repositories, use cases, and BLoCs. The `init` method
/// registers all these dependencies as lazy singletons or factories.
///
/// Usage:
/// ```dart
/// void main() async {
///   await initDb();  // Initialize the database first
///   Injector.init();  // Set up the dependencies
///   runApp(MyApp());
/// }
/// ```
class Injector {
  /// Configures and registers dependencies with the service locator.
  ///
  /// Registers all necessary components including:
  /// - Data sources
  /// - Repositories
  /// - Use cases
  /// - BLoCs
  ///
  /// This method should be called once during the application
  /// initialization to ensure all dependencies are correctly
  /// provided and can be injected where needed.
  static void init() {
    // Register data sources.
    sl.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(),
    );
    sl.registerLazySingleton<WatchlistLocalDataSource>(
      () => WatchlistLocalDataSourceImpl(
        lDataSource: sl<IsarDb>(),
      ),
    );
    sl.registerLazySingleton<FavoritesLocalDataSource>(
      () => FavoritesLocalDataSourceImpl(
        lDataSource: sl<IsarDb>(),
      ),
    );
    sl.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl(
        lDataSource: sl<IsarDb>(),
      ),
    );

    // Register repositories.
    sl.registerLazySingleton<MoviesRespository>(
      () => MoviesRepositoryImpl(sl()),
    );
    sl.registerLazySingleton<WatchlistRepository>(
      () => WatchListRepositoryImpl(sl()),
    );
    sl.registerLazySingleton<FavoritesRepository>(
      () => FavoritesRepositoryImpl(sl()),
    );
    sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()),
    );

    // Register use cases.
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetWatchlistItemsUseCase(sl()));
    sl.registerLazySingleton(() => AddWatchlistItemUseCase(sl()));
    sl.registerLazySingleton(() => RemoveWatchlistItemUseCase(sl()));
    sl.registerLazySingleton(() => CheckIfWatchlistItemAddedUseCase(sl()));

    sl.registerLazySingleton(() => GetFavoriteItemsUseCase(sl()));
    sl.registerLazySingleton(() => AddFavoriteItemUseCase(sl()));
    sl.registerLazySingleton(() => RemoveFavoriteItemUseCase(sl()));
    sl.registerLazySingleton(() => CheckIfFavoriteItemAddedUseCase(sl()));

    sl.registerLazySingleton(() => DeleteAuthData(sl()));
    sl.registerLazySingleton(() => GetAuthToken(sl()));
    sl.registerLazySingleton(() => HasAuthToken(sl()));
    sl.registerLazySingleton(() => SaveAuthToken(sl()));

    // Register BLoCs.
    sl.registerFactory(() => MoviesBloc(sl()));
    sl.registerFactory(() => PopularMoviesBloc(sl()));
    sl.registerFactory(() => TopRatedMoviesBloc(sl()));
  }
}
