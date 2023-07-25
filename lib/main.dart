import 'package:cars/core/utils/Router.dart';
import 'package:cars/features/Home/data/repositories/home_repo_imple.dart';
import 'package:cars/features/Home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'core/utils/service_locator.dart';
import 'features/Home/presentation/manager/movie_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
     BlocProvider(create: (context) =>MovieBloc(
        getIt.get<HomeRepoImpl>()..fetchPopularMovies()
     )
     )
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
       routerConfig: AppRouter.router,
      ),
    );
  }
}

