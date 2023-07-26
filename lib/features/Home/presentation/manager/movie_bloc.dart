import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cars/features/Home/data/repositories/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/movie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(this.homeRepo) : super(MovieInitial()) {
      on<LoadNowPlayingMovies>(_loadPlayingMovies);
      on<LoadPopularMovies>(_loadPopularMovies);
      on<LoadTopRatedMovies>(_loadTopRatedMovies);
  }
  final HomeRepo homeRepo;

  Future<void> _loadPlayingMovies (
      LoadNowPlayingMovies event,
      Emitter<MovieState> emit,
      )async {
      emit(NowPlayingMovieLoading());
      final result = await homeRepo.fetchNowPlayingMovies();
      result.fold((failure) {
        emit(NowPlayingMovieError(failure.errMessage));

      }, (movies) {
       emit(NowPlayingMovieSuccess(movies));
      });
  }
  Future<void> _loadPopularMovies (
      LoadPopularMovies event,
      Emitter<MovieState> emit,
      )async {
    emit(PopularMovieLoading());
    final result = await homeRepo.fetchPopularMovies();
    result.fold((failure) {
      emit(PopularMovieError(failure.errMessage));

    }, (movies) {
      emit(PopularMovieSuccess(movies));
    });
  }

  Future<void>_loadTopRatedMovies (
      LoadTopRatedMovies event,
      Emitter<MovieState> emit,
      )async {
    emit(TopRatedMovieLoading());
    final result = await homeRepo.fetchTopRatedMovies();
    result.fold((failure) {
      emit(TopRatedMovieError(failure.errMessage));

    }, (movies) {
      emit(TopRatedMovieSuccess(movies));
    });
  }

}
