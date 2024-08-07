import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/favorites_repository.dart';

/// A use case for retrieving the list of favorite media items.
///
/// This class defines the business logic for fetching the list of favorite media items
/// from the repository. It extends [BaseUseCase] to provide a standardized approach for
/// executing use cases that return a list of [Media] objects.
class GetFavoriteItemsUseCase extends BaseUseCase<List<Media>, NoParameters> {
  final FavoritesRepository _repository;

  /// Creates an instance of [GetFavoriteItemsUseCase].
  ///
  /// [repository] - The [FavoritesRepository] instance used to interact with the data source
  /// to retrieve the list of favorite media items.
  GetFavoriteItemsUseCase(this._repository);

  /// Executes the use case to retrieve the list of favorite media items.
  ///
  /// This method calls the [getFavoriteListItems] method on the [FavoritesRepository].
  ///
  /// Returns a [Future] that completes with:
  /// - [Right] containing a [List<Media>] of favorite media items if the operation is successful, or
  /// - [Left] containing a [Failure] if an error occurs while fetching the items.
  @override
  Future<Either<Failure, List<Media>>> call(NoParameters p) async {
    return await _repository.getFavoriteListItems();
  }
}
