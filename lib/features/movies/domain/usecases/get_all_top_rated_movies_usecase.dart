import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/movies_repository.dart';

/// A use case for retrieving a list of top-rated movies.
///
/// This use case interacts with the [MoviesRespository] to fetch top-rated movies.
///
/// It extends [BaseUseCase] and implements the `call` method to perform
/// the operation of retrieving top-rated movies based on the provided page number.
///
/// Requires the following parameter:
/// - [MoviesRespository] to perform the fetch operation.
///
/// Example usage:
/// ```dart
/// final getAllTopRatedMoviesUseCase = GetAllTopRatedMoviesUseCase(moviesRespository);
/// final result = await getAllTopRatedMoviesUseCase.call(1);
/// ```
class GetAllTopRatedMoviesUseCase extends BaseUseCase<List<Media>, int> {
  final MoviesRespository _baseMoviesRespository;

  /// Creates an instance of [GetAllTopRatedMoviesUseCase].
  ///
  /// Requires [MoviesRespository] to fetch top-rated movies.
  GetAllTopRatedMoviesUseCase(this._baseMoviesRespository);

  /// Retrieves a list of top-rated movies based on the provided page number.
  ///
  /// Calls the [MoviesRespository] to fetch top-rated movies.
  ///
  /// The parameter [p] is the page number for pagination.
  ///
  /// Returns a [Future] that resolves to an [Either] where:
  /// - [Left] contains a [Failure] if the operation fails.
  /// - [Right] contains a [List<Media>] if the operation succeeds.
  @override
  Future<Either<Failure, List<Media>>> call(int p) async {
    return await _baseMoviesRespository.getAllTopRatedMovies(p);
  }
}
