import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars/core/utils/Router.dart';
import 'package:cars/features/Home/data/models/movie.dart';
import 'package:cars/features/Home/presentation/manager/movie_bloc.dart';
import 'package:cars/features/Home/presentation/views/widgets/popular_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assetsdata.dart';
import '../../../../../core/utils/widget/CustomErrorWidget.dart';
import 'SeeMore.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kPopularView);
          },
            child: SeeMore(
          text: ' Popular',
        )),
        SizedBox(height: 10),
        PopularItemsListView()
      ],
    );
  }
}
