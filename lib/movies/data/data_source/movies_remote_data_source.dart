import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/error%20handling/failures.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

abstract class MovieBaseRemoteDataSource{

  Future<Either<Failures,List<MovieModel>>> getNowPlayingMovies();
  Future<Either<Failures,List<MovieModel>>> getPopularMovies();
  Future<Either<Failures,List<MovieModel>>> getTopRatedMovies();
}
class MovieRemoteDataSource implements MovieBaseRemoteDataSource{
  Dio dio;
  MovieRemoteDataSource(this.dio);
  @override
  Future<Either<Failures,List<MovieModel>>> getNowPlayingMovies() async{
try {
  final response =  await Dio().get(Constants.getNowPlayingPath);
  if(response.data['success']== false){
    print(response.data);
    return left(ServerFailure.fromSuccessBody(response.data));
  }else {
    print(response.data);
    return right((response.data['results'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList());
  }
  } on Exception catch (e) {
  if(e is DioException){
    return  left(ServerFailure.fromDioException(e));
  }
  return  left(ServerFailure(e.toString()));
}


  }

  @override
  Future<Either<Failures,List<MovieModel>>>  getPopularMovies() async{
    try {
      final response =  await dio.get(Constants.getPopularPath);
      if(response.data['success']== false){
        return left(ServerFailure.fromSuccessBody(response.data));
      }else {
        return right((response.data['results'] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList());
      }
    } on Exception catch (e) {
      if(e is DioException){
        return  left(ServerFailure.fromDioException(e));
      }
      return  left(ServerFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failures,List<MovieModel>>>  getTopRatedMovies() async{
    try {
      final response =  await dio.get(Constants.getTopRatedPath);
      if(response.data['success']== false){
        return left(ServerFailure.fromSuccessBody(response.data));
      }else {
        return right((response.data['results'] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList());
      }
    } on Exception catch (e) {
      if(e is DioException){
        return  left(ServerFailure.fromDioException(e));
      }
      return  left(ServerFailure(e.toString()));
    }

  }


}