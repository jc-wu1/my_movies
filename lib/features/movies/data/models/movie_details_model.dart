// ignore_for_file: must_be_immutable

import '../../../../core/local_models/media_details.dart';
import '../../../../core/utils/functions.dart';
import 'movie_model.dart';

class MovieDetailsModel extends MediaDetails {
  MovieDetailsModel({
    required super.tmdbID,
    required super.title,
    required super.posterUrl,
    required super.backdropUrl,
    required super.releaseDate,
    required super.genres,
    required super.runtime,
    required super.overview,
    required super.voteAverage,
    required super.voteCount,
    required super.trailerUrl,
    required super.similar,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      tmdbID: json['id'],
      title: json['title'],
      posterUrl: getPosterUrl(json['poster_path']),
      backdropUrl: getBackdropUrl(json['backdrop_path']),
      releaseDate: getDate(json['release_date']),
      genres: getGenres(json['genres']),
      runtime: getLength(json['runtime']),
      overview: json['overview'] ?? '',
      voteAverage:
          double.parse((json['vote_average'] as double).toStringAsFixed(1)),
      voteCount: getVotesCount(json['vote_count']),
      trailerUrl: getTrailerUrl(json),
      similar: List<MovieModel>.from((json['similar']['results'] as List)
          .map((e) => MovieModel.fromJson(e))),
    );
  }
}
