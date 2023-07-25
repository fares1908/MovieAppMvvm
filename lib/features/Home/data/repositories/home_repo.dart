import 'package:cars/core/errors/Failure.dart';
import 'package:cars/features/Home/data/models/movie.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<MovieModel>>>fetchNowPlayingMovies();

  Future<Either<Failure,List<MovieModel>>>fetchPopularMovies();

  Future<Either<Failure,List<MovieModel>>>fetchTopRatedMovies();
}