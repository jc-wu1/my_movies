import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';
import '../../domain/repository/favorites_repository.dart';
import '../datasource/favorites_local_data_source.dart';
import '../models/favorites_item_model.dart';

/// A concrete implementation of [FavoritesRepository] using a local data source.
///
/// This class provides methods to interact with the local data source for managing
/// favorite media items. It handles operations such as retrieving, adding, removing,
/// and checking favorite items.
class FavoritesRepositoryImpl extends FavoritesRepository {
  final FavoritesLocalDataSource _dataSource;

  /// Creates an instance of [FavoritesRepositoryImpl].
  ///
  /// [dataSource] - The [FavoritesLocalDataSource] instance used for data operations.
  FavoritesRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<Media>>> getFavoriteListItems() async {
    final result = (await _dataSource.getFavoriteItems());
    try {
      return Right(result);
    } on Exception catch (failure) {
      return Left(LocalDbFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> addFavoriteItem(Media media) async {
    try {
      int id = await _dataSource.addFavoriteItem(
        FavoritesItemModel.fromEntity(media),
      );
      return Right(id);
    } on Exception catch (failure) {
      return Left(LocalDbFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavoriteItem(int index) async {
    try {
      await _dataSource.removeFavoriteItem(index);
      return const Right(unit);
    } on Exception catch (failure) {
      return Left(LocalDbFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> checkIfItemAdded(int tmdbId) async {
    try {
      final result = await _dataSource.isItemAdded(tmdbId);
      if (result != null) {
        return Right(result);
      } else {
        return const Left(LocalDbFailure('Not found'));
      }
    } on Exception catch (failure) {
      return Left(LocalDbFailure(failure.toString()));
    }
  }
}
