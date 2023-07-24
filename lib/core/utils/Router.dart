import 'package:cars/SplashScreen.dart';
import 'package:cars/features/Home/presentation/views/home_view.dart';
import 'package:cars/features/Home/presentation/views/widgets/TopRatedMovies.dart';
import 'package:cars/features/Home/presentation/views/widgets/popularMovies.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter{

static const String kHomeView='/homeView';
static const String kTopRatedView='/topRatedView';
static const String kPopularView='/popularView';
 static final router=GoRouter(
     routes:[
       GoRoute(
           path:'/',
         builder: (context, state) =>SplashScreen(),
       ),
       GoRoute(
           path: AppRouter.kHomeView,
         builder: (context, state) => const HomeView(),
       ),
       GoRoute(
           path: AppRouter.kTopRatedView,
         builder: (context, state) => const TopRatedMovies(),
       ),
        GoRoute(
           path: AppRouter.kPopularView,
         builder: (context, state) => const PopularMovies(),
       ),
     ]
 );

}