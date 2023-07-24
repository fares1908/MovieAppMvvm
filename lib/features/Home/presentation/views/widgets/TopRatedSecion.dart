import 'package:cars/core/utils/Router.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assetsdata.dart';
import 'SeeMore.dart';

class TopRatedSection extends StatelessWidget {
  const TopRatedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SeeMore(text:'TopRated',location: AppRouter.kTopRatedView, ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            itemBuilder:(context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(image: AssetImage(AssetData.test)
                  )),
            ),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
