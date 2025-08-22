import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repositories/base_movies_repository.dart';

import '../../../core/error handling/failures.dart';

class GetTopRatedUseCase {
  GetTopRatedUseCase(this.baseMoviesRepository);
  BaseMoviesRepository baseMoviesRepository;
  Future<Either<Failures, List<Movie>>> execute() async {
    return await baseMoviesRepository.getTopRated();

  }
}
