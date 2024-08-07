import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import 'media_details.dart';

part 'media.g.dart';

@Collection(ignore: {'props'})
class Media extends Equatable {
  final Id? id;
  final int tmdbID;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final double voteAverage;
  final String releaseDate;
  final String overview;
  final bool isFavorite;
  final bool isWatchList;

  const Media({
    this.id,
    required this.tmdbID,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
    required this.isFavorite,
    required this.isWatchList,
  });

  factory Media.fromMediaDetails(MediaDetails mediaDetails) {
    return Media(
      tmdbID: mediaDetails.tmdbID,
      title: mediaDetails.title,
      posterUrl: mediaDetails.posterUrl,
      backdropUrl: mediaDetails.backdropUrl,
      voteAverage: mediaDetails.voteAverage,
      releaseDate: mediaDetails.releaseDate,
      overview: mediaDetails.overview,
      isFavorite: mediaDetails.isFavorite,
      isWatchList: mediaDetails.isWatchlist,
    );
  }

  @override
  List<Object?> get props => [
        id,
        tmdbID,
        title,
        posterUrl,
        backdropUrl,
        voteAverage,
        releaseDate,
        overview,
        isFavorite,
        isWatchList,
      ];
}
