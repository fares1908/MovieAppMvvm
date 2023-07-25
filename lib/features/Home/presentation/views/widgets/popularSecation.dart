import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars/core/utils/Router.dart';
import 'package:cars/features/Home/presentation/manager/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assetsdata.dart';
import '../../../../../core/utils/widget/CustomErrorWidget.dart';
import 'SeeMore.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      if (state is PopularMovieSuccess) {
        return Column(
          children: [
            SeeMore(text: ' Popular', location: AppRouter.kPopularView),
            SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    // child: ClipRRect(
                    //   borderRadius: BorderRadius.circular(12),
                    //   child: CachedNetworkImage(
                    //       imageUrl: state.movies[index]),
                    // )
                  child: Text(
                    state.movies[index].releaseDate
                  ),

                )
                ,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        );
      }
      else if (state is PopularMovieError){
          return CustomErrorWidget(message: state.errorMessage,);
      }
      else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
