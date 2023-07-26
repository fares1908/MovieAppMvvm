import 'package:cars/core/utils/assetsdata.dart';
import 'package:cars/features/Home/presentation/views/widgets/ListViewItem.dart';
import 'package:cars/features/Home/presentation/views/widgets/popular_movies_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/style.dart';
import '../../manager/movie_bloc.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Popular Movies'),
          centerTitle: true,
        ),
        body:const PopularMoviesBody()

    );

  }
}
