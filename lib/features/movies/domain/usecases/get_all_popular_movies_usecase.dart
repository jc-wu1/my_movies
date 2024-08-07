import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/movies_repository.dart';

/// A use case for retrieving a list of popular movies.
///
/// This use case interacts with the [MoviesRespository] to fetch popular movies.
///
/// It extends [BaseUseCase] and implements the `call` method to perform
/// the operation of retrieving popular movies based on the provided page number.
///
/// Requires the following parameter:
/// - [MoviesRespository] to perform the fetch operation.
///
/// Example usage:
/// ```dart
/// final getAllPopularMoviesUseCase = GetAllPopularMoviesUseCase(moviesRespository);
/// final result = await getAllPopularMoviesUseCase.call(1);
/// ```
class GetAllPopularMoviesUseCase extends BaseUseCase<List<Media>, int> {
  final MoviesRespository _repository;

  /// Creates an instance of [GetAllPopularMoviesUseCase].
  ///
  /// Requires [MoviesRespository] to fetch popular movies.
  GetAllPopularMoviesUseCase(this._repository);

  /// Retrieves a list of popular movies based on the provided page number.
  ///
  /// Calls the [MoviesRespository] to fetch popular movies.
  ///
  /// The parameter [p] is the page number for pagination.
  ///
  /// Returns a [Future] that resolves to an [Either] where:
  /// - [Left] contains a [Failure] if the operation fails.
  /// - [Right] contains a [List<Media>] if the operation succeeds.
  @override
  Future<Either<Failure, List<Media>>> call(int p) async {
    return await _repository.getAllPopularMovies(p);
  }
}
