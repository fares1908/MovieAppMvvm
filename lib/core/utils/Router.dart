import 'package:cars/SplashScreen.dart';
import 'package:cars/core/utils/service_locator.dart';
import 'package:cars/features/Home/data/repositories/home_repo_imple.dart';
import 'package:cars/features/Home/presentation/manager/movie_bloc.dart';
import 'package:cars/features/Home/presentation/views/home_view.dart';
import 'package:cars/features/Home/presentation/views/widgets/TopRatedMovies.dart';
import 'package:cars/features/Home/presentation/views/widgets/popularMovies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomeView = '/homeView';
  static const String kTopRatedView = '/topRatedView';
  static const String kPopularView = '/popularView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: AppRouter.kHomeView,
      builder: (context, state) =>
          BlocProvider(
            create: (context) {
              return MovieBloc(getIt.get<HomeRepoImpl>())
                ..
                add(LoadNowPlayingMovies())..add(LoadPopularMovies())..add(
                    LoadTopRatedMovies());
            },
            child: const HomeView(),
          ),
    ),
    GoRoute(
      path: AppRouter.kTopRatedView,
      builder: (context, state) =>
          BlocProvider(
            create: (context){
              return MovieBloc(getIt.get<HomeRepoImpl>())..add(LoadTopRatedMovies());
            },
            child: const TopRatedMovies(),
          ),
    ),
    GoRoute(
      path: AppRouter.kPopularView,
      builder: (context, state) => BlocProvider(
          create: ( context) {
            return MovieBloc(getIt.get<HomeRepoImpl>())..add(LoadPopularMovies());
          },
          child: const PopularMovies()),
    ),
  ]);
}
