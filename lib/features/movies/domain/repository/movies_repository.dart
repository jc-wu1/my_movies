import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';
import '../../../../core/local_models/media_details.dart';

/// An abstract class that defines the contract for a movie repository.
///
/// This repository manages the retrieval of movie data through various methods,
/// including fetching details for a specific movie, and lists of popular and
/// top-rated movies.
abstract class MoviesRespository {
  /// Fetches lists of now playing, popular, and top-rated movies.
  ///
  /// Returns a [Future] that completes with an [Either] containing either
  /// a [Failure] or a list of lists of [Media] instances.
  Future<Either<Failure, List<List<Media>>>> getMovies();

  /// Fetches details of a specific movie by its ID.
  ///
  /// [movieId] - The unique identifier of the movie.
  ///
  /// Returns a [Future] that completes with an [Either] containing either
  /// a [Failure] or a [MediaDetails] instance.
  Future<Either<Failure, MediaDetails>> getMovieDetails(int movieId);

  /// Fetches a list of all popular movies for a specific page.
  ///
  /// [page] - The page number for pagination.
  ///
  /// Returns a [Future] that completes with an [Either] containing either
  /// a [Failure] or a list of [Media] instances.
  Future<Either<Failure, List<Media>>> getAllPopularMovies(int page);

  /// Fetches a list of all top-rated movies for a specific page.
  ///
  /// [page] - The page number for pagination.
  ///
  /// Returns a [Future] that completes with an [Either] containing either
  /// a [Failure] or a list of [Media] instances.
  Future<Either<Failure, List<Media>>> getAllTopRatedMovies(int page);
}
