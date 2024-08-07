import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/watchlist_repository.dart';

/// A use case for adding an item to the watchlist.
///
/// This class extends [BaseUseCase] and represents the operation of
/// adding a [Media] item to the watchlist. It interacts with the
/// [WatchlistRepository] to perform this action.
///
/// This use case takes a [Media] object as input and returns an `Either`
/// type, where `Right` contains the ID of the added watchlist item, and
/// `Left` contains a [Failure] if the operation fails.
///
/// Example usage:
/// ```dart
/// final addWatchlistUseCase = AddWatchlistItemUseCase(repository);
/// final result = await addWatchlistUseCase(media);
/// result.fold(
///   (failure) => print('Error: $failure'),
///   (id) => print('Item added with ID: $id'),
/// );
/// ```
class AddWatchlistItemUseCase extends BaseUseCase<int, Media> {
  final WatchlistRepository _baseWatchListRepository;

  /// Creates an instance of [AddWatchlistItemUseCase].
  ///
  /// The [baseWatchListRepository] is required and used to perform the
  /// addition of the watchlist item.
  AddWatchlistItemUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, int>> call(Media p) async {
    return await _baseWatchListRepository.addWatchListItem(p);
  }
}
