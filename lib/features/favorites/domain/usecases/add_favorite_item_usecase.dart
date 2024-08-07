import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/favorites_repository.dart';

/// A use case for adding a media item to the favorites list.
///
/// This class defines the business logic for adding a [Media] item to the favorites list
/// by interacting with the [FavoritesRepository]. It extends [BaseUseCase] to provide a
/// standardized way of handling use cases with a specific input and output type.
class AddFavoriteItemUseCase extends BaseUseCase<int, Media> {
  final FavoritesRepository _repository;

  /// Creates an instance of [AddFavoriteItemUseCase].
  ///
  /// [repository] - The [FavoritesRepository] instance used to interact with the data source.
  AddFavoriteItemUseCase(this._repository);

  /// Executes the use case to add a media item to the favorites list.
  ///
  /// This method calls the [addFavoriteItem] method on the [FavoritesRepository] with
  /// the provided [Media] object.
  ///
  /// Returns a [Future] that completes with:
  /// - [Right] containing the [int] ID of the added item if the operation is successful, or
  /// - [Left] containing a [Failure] if an error occurs.
  @override
  Future<Either<Failure, int>> call(Media p) async {
    return await _repository.addFavoriteItem(p);
  }
}
