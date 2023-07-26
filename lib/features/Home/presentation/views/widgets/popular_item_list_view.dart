import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars/features/Home/data/models/movie.dart';
import 'package:cars/features/Home/presentation/manager/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widget/CustomErrorWidget.dart';
import 'ListViewImage.dart';

class PopularItemsListView extends StatelessWidget {
  const PopularItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is PopularMovieSuccess) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
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
        } else if (state is PopularMovieError) {
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
