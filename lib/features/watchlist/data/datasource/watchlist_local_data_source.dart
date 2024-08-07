import 'package:isar/isar.dart';
import 'package:my_movies/core/local_models/media.dart';

import '../../../../core/database/isar_db.dart';
import '../models/watchlist_item_model.dart';

/// An abstract class that defines the contract for a local data source
/// managing watchlist items.
///
/// This data source handles operations related to retrieving, adding,
/// removing, and checking the presence of items in a watchlist.
abstract class WatchlistLocalDataSource {
  /// Fetches a list of watchlist items from the local data source.
  ///
  /// Returns a [Future] that completes with a list of [WatchlistItemModel] instances.
  Future<List<WatchlistItemModel>> getWatchListItems();

  /// Adds a new item to the watchlist in the local data source.
  ///
  /// [item] - The [WatchlistItemModel] instance to be added to the watchlist.
  ///
  /// Returns a [Future] that completes with the ID of the added item.
  Future<int> addWatchListItem(WatchlistItemModel item);

  /// Removes an item from the watchlist in the local data source.
  ///
  /// [index] - The index of the item to be removed from the watchlist.
  ///
  /// Returns a [Future] that completes once the item has been removed.
  Future<void> removeWatchListItem(int index);

  /// Checks if an item with the specified TMDB ID is already in the watchlist.
  ///
  /// [tmdbID] - The TMDB ID of the item to check.
  ///
  /// Returns a [Future] that completes with the ID of the item if it exists in the watchlist,
  /// or null if it is not found.
  Future<int?> isItemAdded(int tmdbID);
}

/// An implementation of [WatchlistLocalDataSource] that uses [IsarDb]
/// for managing watchlist items in a local database.
///
/// This class provides concrete implementations of the methods defined
/// in the [WatchlistLocalDataSource] interface and handles database operations
/// using the Isar database.
class WatchlistLocalDataSourceImpl extends WatchlistLocalDataSource {
  final IsarDb _lDataSource;

  WatchlistLocalDataSourceImpl({required IsarDb lDataSource})
      : _lDataSource = lDataSource;

  @override
  Future<List<WatchlistItemModel>> getWatchListItems() async {
    try {
      final db = _lDataSource.getDb();
      final favorites =
          await db.medias.filter().isWatchListEqualTo(true).findAll();
      return favorites
          .map((e) => WatchlistItemModel.fromEntity(e))
          .toList()
          .reversed
          .toList();
    } catch (e) {
      throw Exception('DB Operation error $e');
    }
  }

  @override
  Future<int> addWatchListItem(WatchlistItemModel item) async {
    try {
      final db = _lDataSource.getDb();
      final result = await db.writeTxn(() async => await db.medias.put(item));
      return result;
    } catch (e) {
      throw Exception('DB Operation error $e');
    }
  }

  @override
  Future<void> removeWatchListItem(int index) async {
    try {
      final db = _lDataSource.getDb();
      await db.writeTxn(() async => await db.medias.delete(index));
    } catch (e) {
      throw Exception('DB Operation error $e');
    }
  }

  @override
  Future<int?> isItemAdded(int tmdbID) async {
    try {
      final db = _lDataSource.getDb();
      var media = await db.medias
          .filter()
          .tmdbIDEqualTo(tmdbID)
          .isWatchListEqualTo(true)
          .findFirst();
      if (media != null) {
        return media.id!;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('DB Operation error $e');
    }
  }
}
