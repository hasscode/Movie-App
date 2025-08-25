import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movie_app/movies/data/repositories/movies_repository.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_recommendation_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_play_now_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_popular_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_top_rated_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movies_events.dart';

import '../../movies/domain/repositories/base_movies_repository.dart';

final sL = GetIt.instance;
class ServiceLocator {
  init() {
    ///bloc
sL.registerFactory(()=>MoviesBloc(
  sL<GetPlayNowUseCase>(),
  sL<GetPopularUsecase>(),
  sL<GetTopRatedUseCase>(),
  sL<GetMovieRecommendationUseCase>(),
));

    /// UseCase
    sL.registerLazySingleton<GetPlayNowUseCase>(() => GetPlayNowUseCase(sL()));
    sL.registerLazySingleton<GetPopularUsecase>(() => GetPopularUsecase(sL()));
    sL.registerLazySingleton<GetTopRatedUseCase>(() => GetTopRatedUseCase(sL()));
    sL.registerLazySingleton<GetMovieRecommendationUseCase>(() => GetMovieRecommendationUseCase(sL()));

    /// Repository
    sL.registerLazySingleton<BaseMoviesRepository>(() =>
        MoviesRepository(sL()));

    /// Data Source
    sL.registerLazySingleton<MovieBaseRemoteDataSource>(() =>
        MovieRemoteDataSource(sL()));

    /// Dio
    sL.registerLazySingleton(() => Dio());
  }
}