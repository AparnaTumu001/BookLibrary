import 'package:bookfinder/domain/entities/saved_books_model.dart';

abstract class SavedBooksRepository {
  Future<int> insertBook(SavedBookModel book);

  Future<List<SavedBookModel>> getBooks();
}
