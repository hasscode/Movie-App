import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.genreId,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.voteAvg,
    required super.releaseData,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      genreId: json['genreId'],
      title: json['title'],
      backdropPath: json['backdropPath'],
      overview: json['overview'],
      voteAvg: json['voteAvg'],
      releaseData: json['releaseData'],
    );
  }
}
