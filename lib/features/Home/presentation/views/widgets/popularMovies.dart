import 'package:cars/core/utils/assetsdata.dart';
import 'package:cars/features/Home/presentation/views/widgets/ListViewItem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/style.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => const ListViewItem(
        imageUrl: '${AssetData.test}', textName: 'fares', releaseDate: '2020', vote: 3, descreption: 'dgsjyyyyyyyyy',),
        itemCount: 16,
      )
    );
  }
}
