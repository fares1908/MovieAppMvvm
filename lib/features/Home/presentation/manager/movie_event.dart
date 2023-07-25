part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
  @override
  List<Object> get props => [];
}

class LoadNowPlayingMovies extends MovieEvent {}

class LoadPopularMovies extends MovieEvent {}

class LoadTopRatedMovies extends MovieEvent {}