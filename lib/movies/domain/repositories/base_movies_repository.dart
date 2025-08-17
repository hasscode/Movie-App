import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository{
  Future<Movie>getNowPlaying();
  Future<Movie>getPopular();
  Future<Movie>getTopRated();
}