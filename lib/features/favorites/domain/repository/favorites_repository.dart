import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';

/// An abstract repository for managing favorite media items.
///
/// This interface defines methods for interacting with a data source to handle
/// favorite media items, such as retrieving, adding, removing, and checking
/// if an item is in the favorites list.
abstract class FavoritesRepository {
  /// Retrieves a list of favorite media items.
  ///
  /// This method fetches all items marked as favorites from the data source.
  ///
  /// Returns a [Future] that completes with:
  /// - [Right] containing a [List] of [Media] if the operation is successful, or
  /// - [Left] containing a [Failure] if an error occurs.
  Future<Either<Failure, List<Media>>> getFavoriteListItems();

  /// Adds a new media item to the list of favorites.
  ///
  /// This method saves a [Media] object to the data source as a favorite item.
  ///
  /// Returns a [Future] that completes with:
  /// - [Right] containing the [int] ID of the added item if the operation is successful, or
  /// - [Left] containing a [Failure] if an error occurs.
  Future<Either<Failure, int>> addFavoriteItem(Media media);

  /// Removes a media item from the list of favorites.
  ///
  /// This method removes a favorite item from the data source using its index.
  ///
  /// Returns a [Future] that completes with:
  /// - [Right] containing [Unit] if the operation is successful, or
  /// - [Left] containing a [Failure] if an error occurs.
  Future<Either<Failure, Unit>> removeFavoriteItem(int index);

  /// Checks if a media item with the given TMDB ID is added to favorites.
  ///
  /// This method verifies whether an item with a specific TMDB ID is present
  /// in the list of favorites.
  ///
  /// Returns a [Future] that completes with:
  /// - [Right] containing the [int] ID of the item if it is found, or
  /// - [Left] containing a [Failure] if the item is not found or an error occurs.
  Future<Either<Failure, int>> checkIfItemAdded(int tmdbId);
}
