import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../core/app_strings.dart';
import '../models/book_details_model_dao.dart';
import '../models/books_list_model_dao.dart';

abstract class BooksListDatasource {
  Future<BooksListModelDAO> getBooksList(
    String searchParam,
    String limit,
    String offset,
  );
}

class BooksListDatasourceImpl extends BooksListDatasource {
  @override
  Future<BooksListModelDAO> getBooksList(
    String searchParam,
    String limit,
    String offset,
  ) async {
    var url = Uri.parse(
      "${AppStrings.BASE_URL}search.json?title=$searchParam&limit=$limit&offset=$offset",
    );
    print(url.toString());
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return BooksListModelDAO.fromJson(data);
    } else {
      throw Error();
    }
  }
}

abstract class BookDetailsDatasource {
  Future<BookDetailsModelDAO> getBookDetails(String key);
}

class BookDetailsDatasourceImpl extends BookDetailsDatasource {
  @override
  Future<BookDetailsModelDAO> getBookDetails(String key) async {
    key = key.startsWith('/') ? key.replaceFirst("/", "") : key;
    var url = Uri.parse("${AppStrings.BASE_URL}$key.json");
    print(url.toString());
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return BookDetailsModelDAO.fromJson(data);
    } else {
      throw Error();
    }
  }
}
