import 'package:flutter/material.dart';

import '../../../../../core/utils/assetsdata.dart';
import 'ListViewItem.dart';
import 'Top_rated_movies_body.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TopRated Movies'),
    ),
      body: const TopRatedMoviesBody(),
    );
  }
}
