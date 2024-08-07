import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';
import '../../domain/repository/watchlist_repository.dart';
import '../datasource/watchlist_local_data_source.dart';
import '../models/watchlist_item_model.dart';

/// Implementation of the [WatchlistRepository] interface, using a local
/// data source for managing watchlist items.
///
/// This class provides concrete implementations of the methods defined
/// in the [WatchlistRepository] interface, handling operations with
/// the local data source and error management.
class WatchListRepositoryImpl extends WatchlistRepository {
  final WatchlistLocalDataSource _baseWatchlistLocalDataSource;

  WatchListRepositoryImpl(this._baseWatchlistLocalDataSource);

  @override
  Future<Either<Failure, List<Media>>> getWatchListItems() async {
    final result = (await _baseWatchlistLocalDataSource.getWatchListItems());
    try {
      return Right(result);
    } on Exception catch (failure) {
      return Left(LocalDbFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> addWatchListItem(Media media) async {
    try {
      int id = await _baseWatchlistLocalDataSource.addWatchListItem(
        WatchlistItemModel.fromEntity(media),
      );
      return Right(id);
    } on Exception catch (failure) {
      return Left(LocalDbFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeWatchListItem(int index) async {
    try {
      await _baseWatchlistLocalDataSource.removeWatchListItem(index);
      return const Right(unit);
    } on Exception catch (failure) {
      return Left(LocalDbFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> checkIfItemAdded(int tmdbId) async {
    try {
      final result = await _baseWatchlistLocalDataSource.isItemAdded(tmdbId);
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
