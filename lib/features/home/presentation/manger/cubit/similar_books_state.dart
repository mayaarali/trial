part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksFailue extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksFailue(this.errMessage);
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSuccess(this.books);
}

final class SimilarBooksLoading extends SimilarBooksState {}
