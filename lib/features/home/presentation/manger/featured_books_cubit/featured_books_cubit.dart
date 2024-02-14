//import 'dart:ffi';

import 'package:bloc/bloc.dart';
//import 'package:bookly/core/errors/failures.dart';

import 'package:equatable/equatable.dart';
import 'package:trail/features/home/data/models/book_model/book_model.dart';
import 'package:trail/features/home/data/repos/home_repos.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
