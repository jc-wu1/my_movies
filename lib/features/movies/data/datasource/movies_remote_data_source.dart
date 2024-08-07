import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/error_message_model.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';

/// An abstract class that defines the contract for a remote data source
/// that fetches movie-related data.
///
/// This class includes methods to retrieve movies based on various criteria
/// such as now playing, popular, top-rated, and movie details.
abstract class MoviesRemoteDataSource {
  /// Fetches a list of movies that are currently playing in theaters.
  ///
  /// Returns a [Future] that completes with a list of [MovieModel] instances.
  Future<List<MovieModel>> getNowPlayingMovies();

  /// Fetches a list of popular movies.
  ///
  /// Returns a [Future] that completes with a list of [MovieModel] instances.
  Future<List<MovieModel>> getPopularMovies();

  /// Fetches a list of top-rated movies.
  ///
  /// Returns a [Future] that completes with a list of [MovieModel] instances.
  Future<List<MovieModel>> getTopRatedMovies();

  /// Fetches lists of now playing, popular, and top-rated movies.
  ///
  /// Returns a [Future] that completes with a list containing lists of [MovieModel] instances.
  Future<List<List<MovieModel>>> getMovies();

  /// Fetches details of a specific movie by its ID.
  ///
  /// [movieId] - The unique identifier of the movie.
  ///
  /// Returns a [Future] that completes with a [MovieDetailsModel] instance.
  Future<MovieDetailsModel> getMovieDetails(int movieId);

  /// Fetches a list of all popular movies for a specific page.
  ///
  /// [page] - The page number for pagination.
  ///
  /// Returns a [Future] that completes with a list of [MovieModel] instances.
  Future<List<MovieModel>> getAllPopularMovies(int page);

  /// Fetches a list of all top-rated movies for a specific page.
  ///
  /// [page] - The page number for pagination.
  ///
  /// Returns a [Future] that completes with a list of [MovieModel] instances.
  Future<List<MovieModel>> getAllTopRatedMovies(int page);
}

/// An implementation of [MoviesRemoteDataSource] that uses [Dio] for network requests.
///
/// This class provides concrete implementations of methods to fetch movie data
/// from a remote API. It handles different types of movie requests and
/// processes API responses.
class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<List<MovieModel>>> getMovies() async {
    final response = Future.wait(
      [
        getNowPlayingMovies(),
        getPopularMovies(),
        getTopRatedMovies(),
      ],
      eagerError: true,
    );
    return response;
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response = await Dio().get(ApiConstants.getMovieDetailsPath(movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getAllPopularMovies(int page) async {
    final response =
        await Dio().get(ApiConstants.getAllPopularMoviesPath(page));
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getAllTopRatedMovies(int page) async {
    final response =
        await Dio().get(ApiConstants.getAllTopRatedMoviesPath(page));
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
