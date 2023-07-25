import 'package:cars/core/errors/Failure.dart';
import 'package:cars/core/services.dart';

import 'package:cars/features/Home/data/models/movie.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<MovieModel>>> fetchNowPlayingMovies()async {
    try {
      var data=await apiServices.getMovies(endPoint: 'now_playing');
      List<MovieModel>movies=[];
      for (var item in data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    }catch (e) {
     if(e is DioError){
       return left(ServerFailure(e.message));
     }
     return left(ServerFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() async{

    try {
      var data=await apiServices.getMovies(endPoint: 'popular');
      List<MovieModel>movies=[];
      for (var item in data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    }catch (e) {
      if(e is DioError){
        return left(ServerFailure(e.message));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovies() async {
    try {
      var data=await apiServices.getMovies(endPoint: 'top_rated');
      List<MovieModel>movies=[];
      for (var item in data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    }catch (e) {
      if(e is DioError){
        return left(ServerFailure(e.message));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
