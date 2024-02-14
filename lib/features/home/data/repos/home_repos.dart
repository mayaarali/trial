import 'package:dartz/dartz.dart';
import 'package:trail/core/errors/failures.dart';
import 'package:trail/features/home/data/models/book_model/book_model.dart';

abstract class HomeRepo {
  //Future<List<BookModel>> fetchBestSellerBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilartBooks(
      {required String category});
}
