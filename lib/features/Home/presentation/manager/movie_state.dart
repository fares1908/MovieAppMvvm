part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {

}

class  NowPlayingMovieLoading extends MovieState {

}

class  NowPlayingMovieSuccess extends MovieState {
  final List<MovieModel>movies;

  const NowPlayingMovieSuccess(this.movies);
}
class NowPlayingMovieError extends MovieState {
  final String errorMessage;

  const NowPlayingMovieError(this.errorMessage);
}
class  TopRatedMovieLoading extends MovieState {

}

class   TopRatedMovieSuccess extends MovieState {
  final List<MovieModel>movies;

  const  TopRatedMovieSuccess(this.movies);
}
class   TopRatedMovieError extends MovieState {
  final String errorMessage;

  const   TopRatedMovieError(this.errorMessage);
}
class   PopularMovieLoading extends MovieState {

}

class  PopularMovieSuccess extends MovieState {
  final List<MovieModel>movies;

  const PopularMovieSuccess(this.movies);
}
class PopularMovieError extends MovieState {
  final String errorMessage;

  const PopularMovieError(this.errorMessage);
}
