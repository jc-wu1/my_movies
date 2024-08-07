// import 'package:hive_flutter/hive_flutter.dart';
import 'package:isar/isar.dart';
import 'package:my_movies/core/local_models/media.dart';

import '../../../../core/database/isar_db.dart';
import '../models/favorites_item_model.dart';

/// An abstract data source for managing favorite items.
///
/// This interface defines methods for interacting with a local data source
/// to handle favorite items, such as retrieving, adding, removing, and checking
/// if an item is added to the favorites list.
abstract class FavoritesLocalDataSource {
  /// Retrieves a list of favorite items.
  ///
  /// This method fetches all items marked as favorite from the local data source.
  ///
  /// Example:
  /// ```dart
  /// final favoriteItems = await favoritesLocalDataSource.getFavoriteItems();
  /// ```
  ///
  /// Returns a [Future] that completes with a [List] of [FavoritesItemModel].
  Future<List<FavoritesItemModel>> getFavoriteItems();

  /// Adds a new item to the list of favorites.
  ///
  /// This method saves a [FavoritesItemModel] to the local data source as a favorite item.
  ///
  /// Example:
  /// ```dart
  /// final itemId = await favoritesLocalDataSource.addFavoriteItem(item);
  /// ```
  ///
  /// [item] - The [FavoritesItemModel] object to be added to favorites.
  ///
  /// Returns a [Future] that completes with the [int] ID of the added item.
  Future<int> addFavoriteItem(FavoritesItemModel item);

  /// Removes an item from the list of favorites.
  ///
  /// This method removes a favorite item from the local data source using its index.
  ///
  /// Example:
  /// ```dart
  /// await favoritesLocalDataSource.removeFavoriteItem(itemIndex);
  /// ```
  ///
  /// [index] - The index of the favorite item to be removed.
  ///
  /// Returns a [Future] that completes when the item is removed.
  Future<void> removeFavoriteItem(int index);

  /// Checks if an item with the given TMDB ID is added to favorites.
  ///
  /// This method verifies whether an item with a specific TMDB ID is present
  /// in the list of favorites.
  ///
  /// Example:
  /// ```dart
  /// final itemId = await favoritesLocalDataSource.isItemAdded(tmdbID);
  /// if (itemId != null) {
  ///   print('Item is added with ID: $itemId');
  /// } else {
  ///   print('Item not found in favorites.');
  /// }
  /// ```
  ///
  /// [tmdbID] - The TMDB ID of the item to check.
  ///
  /// Returns a [Future] that completes with:
  /// - The [int] ID of the item if it is found, or
  /// - `null` if the item is not found in the favorites.
  Future<int?> isItemAdded(int tmdbID);
}

/// A concrete implementation of [FavoritesLocalDataSource] using [IsarDb] for data storage.
///
/// This class provides methods to interact with the local database for managing
/// favorite items. It handles operations such as retrieving, adding, removing,
/// and checking favorite items using [IsarDb] as the underlying data storage.
class FavoritesLocalDataSourceImpl extends FavoritesLocalDataSource {
  final IsarDb _lDataSource;

  /// Creates an instance of [FavoritesLocalDataSourceImpl].
  ///
  /// [lDataSource] - The [IsarDb] instance used for database operations.
  FavoritesLocalDataSourceImpl({required IsarDb lDataSource})
      : _lDataSource = lDataSource;

  @override
  Future<List<FavoritesItemModel>> getFavoriteItems() async {
    try {
      final db = _lDataSource.getDb();
      final favorites =
          await db.medias.filter().isFavoriteEqualTo(true).findAll();
      return favorites
          .map((e) => FavoritesItemModel.fromEntity(e))
          .toList()
          .reversed
          .toList();
    } catch (e) {
      throw Exception('DB Operation error $e');
    }
  }

  @override
  Future<int> addFavoriteItem(FavoritesItemModel item) async {
    try {
      final db = _lDataSource.getDb();
      final result = await db.writeTxn(() async => await db.medias.put(item));
      return result;
    } catch (e) {
      throw Exception('DB Operation error $e');
    }
  }

  @override
  Future<void> removeFavoriteItem(int index) async {
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
          .isFavoriteEqualTo(true)
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
