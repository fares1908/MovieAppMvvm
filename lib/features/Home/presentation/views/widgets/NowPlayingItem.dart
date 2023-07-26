import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars/core/utils/service_locator.dart';
import 'package:cars/features/Home/data/repositories/home_repo_imple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assetsdata.dart';
import '../../../../../core/utils/widget/CustomErrorWidget.dart';
import '../../manager/movie_bloc.dart';

class NowPlayingItem extends StatelessWidget {
  const NowPlayingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(getIt.get<HomeRepoImpl>())..add(LoadNowPlayingMovies()),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context,
            state,) {
          if (state is NowPlayingMovieSuccess) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: ListView.builder(
                            itemCount: 1,

                            itemBuilder: (context, index) {
                              return CachedNetworkImage(
                                height: 300,
                                width: double.infinity,
                                imageUrl: state.movies[index].backdropPath,
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              );
                            },
                          )),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.redAccent
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        const Text(
                          'Now Playing',
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      state.movies[0].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                )
              ],
            );
          }
          else if (state is NowPlayingMovieError) {
            return CustomErrorWidget(message: state.errorMessage,

            );
          }
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
