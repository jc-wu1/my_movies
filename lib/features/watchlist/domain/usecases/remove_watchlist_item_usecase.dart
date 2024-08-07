import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/watchlist_repository.dart';

/// A use case for removing an item from the watchlist.
///
/// This class extends [BaseUseCase] and represents the operation of
/// removing a specific item from the watchlist. It interacts with the
/// [WatchlistRepository] to perform this action.
///
/// The use case requires an `int` parameter representing the index or
/// identifier of the item to be removed. It returns an `Either` type,
/// where `Right` contains `Unit` to indicate successful completion, and
/// `Left` contains a [Failure] if the operation fails.
///
/// Example usage:
/// ```dart
/// final removeWatchlistUseCase = RemoveWatchlistItemUseCase(repository);
/// final result = await removeWatchlistUseCase(itemId);
/// result.fold(
///   (failure) => print('Error: $failure'),
///   (_) => print('Item removed successfully'),
/// );
/// ```
class RemoveWatchlistItemUseCase extends BaseUseCase<Unit, int> {
  final WatchlistRepository _baseWatchListRepository;

  /// Creates an instance of [RemoveWatchlistItemUseCase].
  ///
  /// The [baseWatchListRepository] is required and used to remove an item
  /// from the watchlist.
  RemoveWatchlistItemUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, Unit>> call(int p) async {
    return await _baseWatchListRepository.removeWatchListItem(p);
  }
}
