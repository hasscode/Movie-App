import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repositories/base_movies_repository.dart';

class GetPlayNowUseCase {
  GetPlayNowUseCase(this.baseMoviesRepository);
  BaseMoviesRepository baseMoviesRepository;
  Future<Movie> execute() async {
    final movie = await baseMoviesRepository.getNowPlaying();
    return movie;
  }
}
