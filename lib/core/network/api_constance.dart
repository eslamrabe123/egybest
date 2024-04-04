class ApiConstance {
  static const String appKey = '4c5565d2163dc02e65587a209bbd07ab';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  /// all
  static const String all = '$baseUrl/trending/all/day?api_key=$appKey';

  /// MOVIES
  static const String nowPlayingMoviesApiPath =
      '$baseUrl/movie/now_playing?&api_key=$appKey';
  static const String topRatedMoviesApiPath =
      '$baseUrl/movie/top_rated?&api_key=$appKey';
  static const String popularMoviesApiPath =
      '$baseUrl/movie/popular?&api_key=$appKey';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => "$imageBaseUrl$path";

  static String movieDetailsPath(int movieId) {
    return '$baseUrl/movie/$movieId?&api_key=$appKey';
  }

  static String recommendationMoviesPath(int movieId) {
    return '$baseUrl/movie/$movieId/recommendations?&api_key=$appKey';
  }

  static String searchMoviesByNamePath(String movieName) {
    return '$baseUrl/search/movie?query=$movieName&include_adult=true&api_key=$appKey';
  }

  /// TV SHOWS
  static const String popularTVShows = '$baseUrl/tv/popular?&api_key=$appKey';
  static const String topRatedTVApiPath =
      '$baseUrl/tv/top_rated?&api_key=$appKey';
  static const String trendingTVApiPath =
      '$baseUrl/trending/tv/day?&api_key=$appKey';
}
