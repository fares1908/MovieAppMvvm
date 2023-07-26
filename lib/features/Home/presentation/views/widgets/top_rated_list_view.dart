import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars/core/utils/service_locator.dart';
import 'package:cars/features/Home/data/models/movie.dart';
import 'package:cars/features/Home/presentation/manager/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widget/CustomErrorWidget.dart';
import '../../../data/repositories/home_repo_imple.dart';
import 'ListViewImage.dart';

class TopRatedItemsListView extends StatelessWidget {
  const TopRatedItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => MovieBloc(getIt.get<HomeRepoImpl>())..add(LoadTopRatedMovies()),
  child: BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is TopRatedMovieSuccess) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListViewItemImage(
                        imageUrl: state.movies[index].backdropPath,
                      )),
                  itemCount: state.movies.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
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
    ),
);
  }
}
