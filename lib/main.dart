import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trail/constants.dart';
import 'package:trail/core/utilities/app_router.dart';
import 'package:trail/core/utilities/service_locator.dart';
import 'package:trail/features/home/data/repos/home_repo_imp.dart';
import 'package:trail/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:trail/features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImp>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImp>(),
          )..fetchNewestBooks(),
        ),
        /* BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImp>(),
          )..fetchSimilarBooks(),
        ),
        */
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        //navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimaryColor,
          appBarTheme: const AppBarTheme(color: kprimaryColor),
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        // home: const SplashView(),
      ),
    );
  }
}
