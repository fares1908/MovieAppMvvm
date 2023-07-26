import 'package:cars/core/utils/Router.dart';
import 'package:cars/features/Home/presentation/views/widgets/top_rated_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assetsdata.dart';
import 'SeeMore.dart';

class TopRatedSection extends StatelessWidget {
  const TopRatedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kTopRatedView);
    },
            child: SeeMore(
          text: 'TopRated',

        )),
        TopRatedItemsListView()
      ],
    );
  }
}
