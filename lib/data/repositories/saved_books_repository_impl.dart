import 'package:bookfinder/data/models/saved_books_model_dao.dart';

import '../../domain/entities/saved_books_model.dart';
import '../../domain/repositories/saved_books_repository.dart';
import '../data_sources/saved_books_datasource.dart';

class SavedBooksRepositoryImpl implements SavedBooksRepository {
  final SavedBookLocalDataSource localDataSource;

  SavedBooksRepositoryImpl(this.localDataSource);

  @override
  Future<int> insertBook(SavedBookModel book) {
    final model = SavedBookModelDao(
      title: book.title,
      authorName: book.authorName,
      imageLink: book.imageLink,
      id: book.id,
    );
    return localDataSource.insertBook(model);
  }

  @override
  Future<List<SavedBookModel>> getBooks() {
    return localDataSource.getAllBooks();
  }
}
