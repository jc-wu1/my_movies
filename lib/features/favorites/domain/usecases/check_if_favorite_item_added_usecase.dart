import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/favorites_repository.dart';

/// A use case for checking if a media item is added to the favorites list.
///
/// This class defines the business logic for checking whether a media item, identified
/// by its `tmdbId`, is present in the favorites list. It extends [BaseUseCase] to provide
/// a standardized way of handling use cases with a specific input and output type.
class CheckIfFavoriteItemAddedUseCase extends BaseUseCase<int?, int> {
  final FavoritesRepository _repository;

  /// Creates an instance of [CheckIfFavoriteItemAddedUseCase].
  ///
  /// [repository] - The [FavoritesRepository] instance used to interact with the data source.
  CheckIfFavoriteItemAddedUseCase(this._repository);

  /// Executes the use case to check if a media item is added to the favorites list.
  ///
  /// This method calls the [checkIfItemAdded] method on the [FavoritesRepository] with
  /// the provided `tmdbId`.
  ///
  /// Returns a [Future] that completes with:
  /// - [Right] containing the [int?] ID of the item if it is found in the favorites list, or
  /// - [Left] containing a [Failure] if an error occurs or the item is not found.
  @override
  Future<Either<Failure, int?>> call(int p) async {
    return await _repository.checkIfItemAdded(p);
  }
}
