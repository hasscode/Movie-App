import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

import '../../../core/error handling/failures.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failures, List<Movie>>> getNowPlaying();
  Future<Either<Failures, List<Movie>>> getPopular();
  Future<Either<Failures, List<Movie>>> getTopRated();
}