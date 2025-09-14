import 'package:bookfinder/data/mappers/book_details_model_mapper.dart';
import 'package:bookfinder/data/mappers/books_list_model_mapper.dart';
import 'package:bookfinder/data/models/book_details_model_dao.dart';
import 'package:bookfinder/domain/entities/book_details_model.dart';
import 'package:bookfinder/domain/repositories/books_list_repository.dart';

import '../../domain/entities/books_list_model.dart';
import '../data_sources/books_list_datasource.dart';
import '../models/books_list_model_dao.dart';

class BooksListRepositoryImpl extends BooksListRepository {
  BooksListDatasource datasource;

  BooksListRepositoryImpl(this.datasource);

  @override
  Future<BooksListModel> getBooks(String param,String limit,String offset) async {
    BooksListModelDAO booksListModel = await datasource.getBooksList(param,limit,offset);
    return booksListModel.toDomain();
  }
}

class BookDetailsRepositoryImpl extends BookDetailsRepository {
  BookDetailsDatasource datasource;

  BookDetailsRepositoryImpl(this.datasource);

  @override
  Future<BookDetailsModel> getBookDetails(String param) async {
    BookDetailsModelDAO booksListModel = await datasource.getBookDetails(param);
    return booksListModel.toDomain();
  }
}
