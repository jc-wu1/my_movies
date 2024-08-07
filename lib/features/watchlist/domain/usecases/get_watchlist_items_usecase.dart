import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/watchlist_repository.dart';

/// A use case for retrieving the list of watchlist items.
///
/// This class extends [BaseUseCase] and represents the operation of
/// fetching the list of items from the watchlist. It interacts with the
/// [WatchlistRepository] to retrieve this data.
///
/// This use case does not require any parameters and returns an `Either`
/// type, where `Right` contains a list of [Media] objects representing the
/// items in the watchlist, and `Left` contains a [Failure] if the operation
/// fails.
///
/// Example usage:
/// ```dart
/// final getWatchlistUseCase = GetWatchlistItemsUseCase(repository);
/// final result = await getWatchlistUseCase(NoParameters());
/// result.fold(
///   (failure) => print('Error: $failure'),
///   (mediaList) => mediaList.forEach((media) => print('Media: $media')),
/// );
/// ```
class GetWatchlistItemsUseCase extends BaseUseCase<List<Media>, NoParameters> {
  final WatchlistRepository _baseWatchListRepository;

  /// Creates an instance of [GetWatchlistItemsUseCase].
  ///
  /// The [baseWatchListRepository] is required and used to fetch the list
  /// of items from the watchlist.
  GetWatchlistItemsUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, List<Media>>> call(NoParameters p) async {
    return await _baseWatchListRepository.getWatchListItems();
  }
}
