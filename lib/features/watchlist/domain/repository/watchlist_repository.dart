import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';

/// An abstract class defining the contract for a repository that manages
/// watchlist items.
///
/// This repository handles operations related to retrieving, adding,
/// removing, and checking the presence of items in a watchlist.
abstract class WatchlistRepository {
  /// Fetches a list of watchlist items.
  ///
  /// Returns a [Future] that completes with an [Either] containing a
  /// [Failure] or a list of [Media] instances.
  Future<Either<Failure, List<Media>>> getWatchListItems();

  /// Adds a new item to the watchlist.
  ///
  /// [media] - The [Media] instance to be added to the watchlist.
  ///
  /// Returns a [Future] that completes with an [Either] containing a
  /// [Failure] or the ID of the added item.
  Future<Either<Failure, int>> addWatchListItem(Media media);

  /// Removes an item from the watchlist.
  ///
  /// [index] - The index of the item to be removed from the watchlist.
  ///
  /// Returns a [Future] that completes with an [Either] containing a
  /// [Failure] or a unit value indicating success.
  Future<Either<Failure, Unit>> removeWatchListItem(int index);

  /// Checks if an item with the specified TMDB ID is already in the watchlist.
  ///
  /// [tmdbId] - The TMDB ID of the item to check.
  ///
  /// Returns a [Future] that completes with an [Either] containing a
  /// [Failure] or the ID of the item if it exists in the watchlist,
  /// or null if not found.
  Future<Either<Failure, int>> checkIfItemAdded(int tmdbId);
}
