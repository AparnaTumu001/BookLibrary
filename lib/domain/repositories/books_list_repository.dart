import '../entities/book_details_model.dart';
import '../entities/books_list_model.dart';

abstract class BooksListRepository {
  Future<BooksListModel> getBooks(String param, String limit, String offset);
}

abstract class BookDetailsRepository {
  Future<BookDetailsModel> getBookDetails(String param);
}
