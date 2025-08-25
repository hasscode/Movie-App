import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/utils/enums/request_state_enum.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_recommendation_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_play_now_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_popular_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_top_rated_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movies_events.dart';
import 'package:movie_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc <MoviesEvent ,MoviesState>{
  final GetPlayNowUseCase getNowPlaying;
  final GetPopularUsecase getPopular;
  final GetTopRatedUseCase getTopRated;
  final GetMovieRecommendationUseCase getMovieRecommendation;
  MoviesBloc(this.getNowPlaying, this.getPopular, this.getTopRated,this.getMovieRecommendation) :super (MoviesState()){
    on<GetNowPlayingMovies>(_getNowPlayingMovies);
    on<GetPopularMovies>(_getPopularMovies);
    on<GetTopRatedMovies>(_getTopRatedMovies);
    on<GetMovieRecommendations>(_getMovieRecommendations);
  }

Future<void>_getNowPlayingMovies(GetNowPlayingMovies event ,Emitter<MoviesState> emit)async{

    final result = await getNowPlaying.execute();
    result.fold((failure){
      emit(state.copyWith(
        nowPlayingState: RequestState.error,
        nowPlayingMessage: failure.errMessage
      ));

    }, (movies){
emit(state.copyWith(
  nowPlayingState: RequestState.success,
  nowPlayingMovies: movies
));
    });

}
Future<void>_getPopularMovies(GetPopularMovies event ,Emitter<MoviesState> emit)async{

  final result = await getPopular.execute();
  result.fold((failure){
    emit(state.copyWith(
      popularState: RequestState.error,
          popularMessage: failure.errMessage
    ));

  }, (movies){
    emit(state.copyWith(
      popularState: RequestState.success,
          popularMovies:  movies
    ));
  });
}
Future<void>_getTopRatedMovies(GetTopRatedMovies event ,Emitter<MoviesState> emit)async{

  final result = await getTopRated.execute();
  result.fold((failure){
    emit(
      state.copyWith(
        topRatedMessage: failure.errMessage,
        topRatedState: RequestState.error
      )
    );

  }, (movies){
    emit(state.copyWith(
      topRatedState: RequestState.success,
      topRatedMovies: movies
    ));
  });

}

  Future<void>_getMovieRecommendations(GetMovieRecommendations event ,Emitter<MoviesState> emit)async{

    final result = await getMovieRecommendation.execute(event.movieId);
    result.fold((failure){
      emit(
          state.copyWith(
              movieRecommendationsMessage: failure.errMessage,
              movieRecommendationsState: RequestState.error
          )
      );

    }, (movies){
      emit(state.copyWith(
          movieRecommendationsState: RequestState.success,
          movieRecommendations: movies
      ));
    });

  }

}