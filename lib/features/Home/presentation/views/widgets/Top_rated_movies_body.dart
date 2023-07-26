import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assetsdata.dart';
import '../../../../../core/utils/widget/CustomErrorWidget.dart';
import '../../manager/movie_bloc.dart';
import 'ListViewItem.dart';

class TopRatedMoviesBody extends StatelessWidget {
  const TopRatedMoviesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is TopRatedMovieSuccess) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                child: ListView.builder(
                  itemCount: state.movies.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListViewItem(
                      imageUrl: state.movies[index].backdropPath,
                      textName: state.movies[index].title,
                      releaseDate: state.movies[index].releaseDate,
                      vote: state.movies[index].voteAverage,
                      descreption: state.movies[index].overview,
                    ),
                  ),
                ),
              )
            ],
          );
        } else if (state is TopRatedMovieError) {
          return CustomErrorWidget(
            message: state.errorMessage,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
