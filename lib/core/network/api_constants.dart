/// A class containing API constants and utility methods for constructing URLs
/// for The Movie Database (TMDb) API.
class ApiConstants {
  /// The API key used for authenticating requests to TMDb.
  static const String apiKey = '39e0f9027eb10efe2e5252f43e770be8';

  /// The base URL for TMDb API.
  static const String baseUrl = 'https://api.themoviedb.org/3';

  /// The base URL for backdrop images.
  static const String baseBackdropUrl = 'https://image.tmdb.org/t/p/w1280';

  /// The base URL for poster images.
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w500';

  /// The base URL for profile images.
  static const String baseProfileUrl = 'https://image.tmdb.org/t/p/w300';

  /// The base URL for still images.
  static const String baseStillUrl = 'https://image.tmdb.org/t/p/w500';

  /// The base URL for avatar images.
  static const String baseAvatarUrl = 'https://image.tmdb.org/t/p/w185';

  /// The base URL for YouTube videos.
  static const String baseVideoUrl = 'https://www.youtube.com/watch?v=';

  /// The URL for the placeholder image when no image is available.
  static const String noImagePlaceholder =
      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg';

  /// The URL for fetching now-playing movies.
  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  /// The URL for fetching popular movies.
  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  /// The URL for fetching top-rated movies.
  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  /// Returns the URL for fetching details of a specific movie by its [movieId].
  ///
  /// The response includes additional information like videos and similar movies.
  static String getMovieDetailsPath(int movieId) {
    return '$baseUrl/movie/$movieId?api_key=$apiKey&append_to_response=videos,similar';
  }

  /// Returns the URL for fetching all popular movies for a specific [page].
  static String getAllPopularMoviesPath(int page) {
    return '$baseUrl/movie/popular?api_key=$apiKey&page=$page';
  }

  /// Returns the URL for fetching all top-rated movies for a specific [page].
  static String getAllTopRatedMoviesPath(int page) {
    return '$baseUrl/movie/top_rated?api_key=$apiKey&page=$page';
  }
}
