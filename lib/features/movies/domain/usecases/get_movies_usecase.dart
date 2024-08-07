import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/movies_repository.dart';

/// A use case for retrieving multiple lists of movies.
///
/// This use case interacts with the [MoviesRespository] to fetch different lists of movies,
/// such as popular, top-rated, and upcoming movies.
///
/// It extends [BaseUseCase] and implements the `call` method to perform
/// the operation of retrieving these lists of movies.
///
/// Requires the following parameter:
/// - [MoviesRespository] to perform the fetch operation.
///
/// Example usage:
/// ```dart
/// final getMoviesUseCase = GetMoviesUseCase(moviesRespository);
/// final result = await getMoviesUseCase.call(NoParameters());
/// ```
class GetMoviesUseCase extends BaseUseCase<List<List<Media>>, NoParameters> {
  final MoviesRespository _baseMoviesRespository;

  /// Creates an instance of [GetMoviesUseCase].
  ///
  /// Requires [MoviesRespository] to fetch movie lists.
  GetMoviesUseCase(this._baseMoviesRespository);

  /// Retrieves multiple lists of movies, such as popular, top-rated, and upcoming.
  ///
  /// Calls the [MoviesRespository] to fetch these lists of movies.
  ///
  /// The parameter [p] is an instance of [NoParameters], indicating no additional parameters are needed.
  ///
  /// Returns a [Future] that resolves to an [Either] where:
  /// - [Left] contains a [Failure] if the operation fails.
  /// - [Right] contains a [List<List<Media>>] if the operation succeeds.
  @override
  Future<Either<Failure, List<List<Media>>>> call(NoParameters p) async {
    return await _baseMoviesRespository.getMovies();
  }
}
