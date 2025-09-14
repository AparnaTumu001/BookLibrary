import 'dart:async';
import 'package:bookfinder/domain/entities/book_details_model.dart';
import 'package:bookfinder/domain/entities/books_list_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/books_list_repository.dart';

class GetBooksListUseCase
    implements UseCase<Either<Failure, BooksListModel>, BooksListParams> {
  final BooksListRepository booksListRepository;

  GetBooksListUseCase(this.booksListRepository);

  @override
  Future<Either<Failure, BooksListModel>> call(BooksListParams params) async {
    try {
      final result = await booksListRepository.getBooks(params.query,params.limit,params.offset);
      return Right(result);
    } catch (e) {
      print(e);
      return Left(ServerError("Failed to fetch books"));
    }
  }
}

class GetBookDetailsUseCase
    implements UseCase<Either<Failure, BookDetailsModel>, String> {
  final BookDetailsRepository bookDetailsRepository;

  GetBookDetailsUseCase(this.bookDetailsRepository);

  @override
  Future<Either<Failure, BookDetailsModel>> call(String params) async {
    try {
      final result = await bookDetailsRepository.getBookDetails(params);
      return Right(result);
    } catch (e) {
      print(e);
      return Left(ServerError("Failed to fetch books"));
    }
  }
}

class BooksListParams {
  final String query;
  final String limit;
  final String offset;

  const BooksListParams({
    required this.query,
    required this.limit,
    required this.offset,
  });

  BooksListParams copyWith({
    String? query,
    String? limit,
    String? offset,
  }) {
    return BooksListParams(
      query: query ?? this.query,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }
}

