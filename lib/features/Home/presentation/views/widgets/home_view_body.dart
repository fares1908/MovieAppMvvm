import 'package:cars/core/utils/assetsdata.dart';
import 'package:cars/features/Home/presentation/views/widgets/ListViewImage.dart';
import 'package:cars/features/Home/presentation/views/widgets/NowPlayingItem.dart';
import 'package:cars/features/Home/presentation/views/widgets/SeeMore.dart';
import 'package:cars/features/Home/presentation/views/widgets/TopRatedSecion.dart';
import 'package:cars/features/Home/presentation/views/widgets/popularSecation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/movie_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              NowPlayingItem(),
              SizedBox(
                height:8,
              ),
              PopularSection(),
              SizedBox(
                height:8,
              ),
              TopRatedSection()
            ],
          ),
        ),
      ),
    );
  }


}


