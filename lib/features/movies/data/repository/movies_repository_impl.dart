import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/media.dart';
import '../../../../core/local_models/media_details.dart';
import '../../domain/repository/movies_repository.dart';
import '../datasource/movies_remote_data_source.dart';

/// An implementation of [MoviesRespository] that uses [MoviesRemoteDataSource] for
/// fetching movie-related data from a remote API.
///
/// This class provides concrete implementations of methods defined in the
/// [MoviesRespository] interface and handles different types of errors
/// by returning appropriate [Failure] instances.
class MoviesRepositoryImpl extends MoviesRespository {
  final MoviesRemoteDataSource _remoteDataSource;

  MoviesRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, MediaDetails>> getMovieDetails(int movieId) async {
    try {
      final result = await _remoteDataSource.getMovieDetails(movieId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<List<Media>>>> getMovies() async {
    try {
      final result = await _remoteDataSource.getMovies();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Media>>> getAllPopularMovies(int page) async {
    try {
      final result = await _remoteDataSource.getAllPopularMovies(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Media>>> getAllTopRatedMovies(int page) async {
    try {
      final result = await _remoteDataSource.getAllTopRatedMovies(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }
}
