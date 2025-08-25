import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

import '../../../core/utils/enums/request_state_enum.dart';

class MoviesState extends Equatable {
 final List<Movie> nowPlayingMovies;
 final RequestState nowPlayingState;
 final String nowPlayingMessage;

 final List<Movie> popularMovies;
 final RequestState popularState;
 final String popularMessage;

 final List<Movie> topRatedMovies;
 final RequestState topRatedState;
 final String topRatedMessage;

 final List<Movie> movieRecommendations;
 final RequestState movieRecommendationsState;
 final String movieRecommendationsMessage;

 const MoviesState({
 this.movieRecommendations = const [],
 this.movieRecommendationsState =RequestState.loading,
 this.movieRecommendationsMessage= '',
  this.nowPlayingMovies = const [],
  this.nowPlayingState = RequestState.loading,
  this.nowPlayingMessage = '',
  this.popularMovies = const [],
  this.popularState = RequestState.loading,
  this.popularMessage = '',
  this.topRatedMovies = const [],
  this.topRatedState = RequestState.loading,
  this.topRatedMessage = '',
 });

 MoviesState copyWith({
  List<Movie>? nowPlayingMovies,
  RequestState? nowPlayingState,
  String? nowPlayingMessage,
  List<Movie>? popularMovies,
  RequestState? popularState,
  String? popularMessage,
  List<Movie>? topRatedMovies,
  RequestState? topRatedState,
  String? topRatedMessage,
  List<Movie>? movieRecommendations,
  RequestState? movieRecommendationsState,
  String? movieRecommendationsMessage,
 }) {
  return MoviesState(
   nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
   nowPlayingState: nowPlayingState ?? this.nowPlayingState,
   nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
   popularMovies: popularMovies ?? this.popularMovies,
   popularState: popularState ?? this.popularState,
   popularMessage: popularMessage ?? this.popularMessage,
   topRatedMovies: topRatedMovies ?? this.topRatedMovies,
   topRatedState: topRatedState ?? this.topRatedState,
   topRatedMessage: topRatedMessage ?? this.topRatedMessage,
   movieRecommendations: movieRecommendations ?? this.movieRecommendations,
      movieRecommendationsState: movieRecommendationsState ?? this.movieRecommendationsState,
   movieRecommendationsMessage: movieRecommendationsMessage ?? this.movieRecommendationsMessage
  );
 }

 @override
 List<Object?> get props => [
  nowPlayingMovies,
  nowPlayingState,
  nowPlayingMessage,
  popularMovies,
  popularState,
  popularMessage,
  topRatedMovies,
  topRatedState,
  topRatedMessage,
  movieRecommendationsMessage,
  movieRecommendations,
  movieRecommendationsState
 ];
}