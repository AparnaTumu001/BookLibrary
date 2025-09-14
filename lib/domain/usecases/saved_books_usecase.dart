import 'package:bookfinder/domain/entities/saved_books_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/saved_books_repository.dart';
import 'books_list_usecase.dart';

class InsertBookUseCase
    implements UseCase<Either<Failure, int>, SavedBookModel> {
  final SavedBooksRepository repository;

  InsertBookUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(SavedBookModel params) async {
    try {
      var response = await repository.insertBook(params);
      return Right(response);
    } catch (e) {
      return Left(ServerError("Failed to fetch books"));
    }
  }
}

class GetBooksUseCase
    implements UseCase<Either<Failure, List<SavedBookModel>>, BooksListParams> {
  final SavedBooksRepository repository;

  GetBooksUseCase(this.repository);

  @override
  Future<Either<Failure, List<SavedBookModel>>> call(
    BooksListParams booksListParam,
  ) async {
    try {
      var result = await repository.getBooks();
      return Right(result);
    } catch (e) {
      return Left(ServerError('Failed to fetch details'));
    }
  }
}
