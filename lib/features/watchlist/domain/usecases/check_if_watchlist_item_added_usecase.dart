import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/watchlist_repository.dart';

/// A use case for checking if a watchlist item is already added.
///
/// This class extends [BaseUseCase] and represents the operation of
/// checking whether a specific [Media] item is present in the watchlist.
/// It interacts with the [WatchlistRepository] to perform this check.
///
/// This use case takes the TMDB ID of the item as input and returns an `Either`
/// type, where `Right` contains the ID of the item if it is found in the watchlist,
/// and `Left` contains a [Failure] if the operation fails or if the item is not found.
///
/// Example usage:
/// ```dart
/// final checkWatchlistUseCase = CheckIfWatchlistItemAddedUseCase(repository);
/// final result = await checkWatchlistUseCase(tmdbId);
/// result.fold(
///   (failure) => print('Error: $failure'),
///   (id) => print('Item ID in watchlist: $id'),
/// );
/// ```
class CheckIfWatchlistItemAddedUseCase extends BaseUseCase<int, int> {
  final WatchlistRepository _watchlistRepository;

  /// Creates an instance of [CheckIfWatchlistItemAddedUseCase].
  ///
  /// The [watchlistRepository] is required and used to perform the check
  /// to determine if an item is in the watchlist.
  CheckIfWatchlistItemAddedUseCase(this._watchlistRepository);

  @override
  Future<Either<Failure, int>> call(int p) async {
    return await _watchlistRepository.checkIfItemAdded(p);
  }
}
