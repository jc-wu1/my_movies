import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media_details.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/movies_repository.dart';

/// A use case for retrieving details of a specific movie.
///
/// This use case interacts with the [MoviesRespository] to fetch detailed information
/// about a movie based on the provided movie ID.
///
/// It extends [BaseUseCase] and implements the `call` method to perform
/// the operation of retrieving movie details.
///
/// Requires the following parameter:
/// - [MoviesRespository] to perform the fetch operation.
///
/// Example usage:
/// ```dart
/// final getMoviesDetailsUseCase = GetMoviesDetailsUseCase(moviesRespository);
/// final result = await getMoviesDetailsUseCase.call(123);
/// ```
class GetMoviesDetailsUseCase extends BaseUseCase<MediaDetails, int> {
  final MoviesRespository _baseMoviesRespository;

  /// Creates an instance of [GetMoviesDetailsUseCase].
  ///
  /// Requires [MoviesRespository] to fetch movie details.
  GetMoviesDetailsUseCase(this._baseMoviesRespository);

  /// Retrieves detailed information about a specific movie based on the provided movie ID.
  ///
  /// Calls the [MoviesRespository] to fetch movie details.
  ///
  /// The parameter [p] is the movie ID used to retrieve the movie details.
  ///
  /// Returns a [Future] that resolves to an [Either] where:
  /// - [Left] contains a [Failure] if the operation fails.
  /// - [Right] contains a [MediaDetails] if the operation succeeds.
  @override
  Future<Either<Failure, MediaDetails>> call(int p) async {
    return await _baseMoviesRespository.getMovieDetails(p);
  }
}
