import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trail/core/utilities/service_locator.dart';
import 'package:trail/features/home/data/models/book_model/book_model.dart';
import 'package:trail/features/home/data/repos/home_repo_imp.dart';
import 'package:trail/features/home/presentation/manger/cubit/similar_books_cubit.dart';
import 'package:trail/features/home/presentation/views/book_details_view.dart';
import 'package:trail/features/home/presentation/views/home_view.dart';
import 'package:trail/features/search/presentation/views/search.dart';
import 'package:trail/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  late final BookModel bookModel;
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeview',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/searchview',
        builder: (context, state) => const SearchView(),
      ),
      /*   GoRoute(
        path: '/bookdetails',
        builder: (context, state) => const BookDetailsView(
          bookModel: BookModel(volumeInfo: volumeInfo),
        ),
      ),
*/

      GoRoute(
        path: '/bookdetailsview',
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImp>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
    ],
  );
}
