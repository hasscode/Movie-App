abstract class MoviesEvent{}
 class GetNowPlayingMovies extends MoviesEvent{}
 class GetPopularMovies extends MoviesEvent{}
 class GetTopRatedMovies extends MoviesEvent{}
 class GetMovieRecommendations extends MoviesEvent{
  final int movieId;
  GetMovieRecommendations(this.movieId);
 }