import 'package:flutter/material.dart';

import '../../../../../core/utils/assetsdata.dart';
import 'ListViewItem.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TopRated Movies'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => const ListViewItem(
            imageUrl: '${AssetData.test}', textName: 'fares', releaseDate: '2020', vote: 3, descreption: 'dgsjyyyyyyyyy',),
          itemCount: 16,
        )
    );
  }
}
