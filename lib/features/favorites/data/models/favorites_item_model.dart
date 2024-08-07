import '../../../../core/local_models/media.dart';

class FavoritesItemModel extends Media {
  const FavoritesItemModel({
    required super.tmdbID,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.posterUrl,
    required super.backdropUrl,
    required super.overview,
    required super.isFavorite,
    required super.isWatchList,
  });

  factory FavoritesItemModel.fromEntity(Media media) {
    return FavoritesItemModel(
      tmdbID: media.tmdbID,
      title: media.title,
      releaseDate: media.releaseDate,
      voteAverage: media.voteAverage,
      posterUrl: media.posterUrl,
      backdropUrl: media.backdropUrl,
      overview: media.overview,
      isFavorite: media.isFavorite,
      isWatchList: media.isWatchList,
    );
  }
}
