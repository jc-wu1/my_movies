import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/favorites_repository.dart';

/// A use case for removing a favorite media item.
///
/// This class defines the business logic for removing a media item from the list of
/// favorite items in the repository. It extends [BaseUseCase] to provide a standardized
/// approach for executing use cases that modify data and return a unit result.
class RemoveFavoriteItemUseCase extends BaseUseCase<Unit, int> {
  final FavoritesRepository _repository;

  /// Creates an instance of [RemoveFavoriteItemUseCase].
  ///
  /// [repository] - The [FavoritesRepository] instance used to interact with the data source
  /// to remove a favorite media item.
  RemoveFavoriteItemUseCase(this._repository);

  /// Executes the use case to remove a favorite media item.
  ///
  /// This method calls the [removeFavoriteItem] method on the [FavoritesRepository] with the
  /// provided item index.
  ///
  /// [p] - The index of the favorite media item to be removed.
  ///
  /// Returns a [Future] that completes with:
  /// - [Right] containing [Unit] if the removal is successful, or
  /// - [Left] containing a [Failure] if an error occurs during the removal process.
  @override
  Future<Either<Failure, Unit>> call(int p) async {
    return await _repository.removeFavoriteItem(p);
  }
}
