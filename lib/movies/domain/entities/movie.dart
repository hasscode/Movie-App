import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final List<int> genreId;
  final String title;
  final String backdropPath;
  final String overview;
  final String releaseData;
  final double voteAvg;

  const Movie({
    required this.id,
    required this.genreId,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.voteAvg,
    required this.releaseData,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    genreId,
    title,
    backdropPath,
    overview,
    releaseData,
    voteAvg,
  ];
}
