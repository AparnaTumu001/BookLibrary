import 'package:bookfinder/data/models/saved_books_model_dao.dart';
import 'package:sqflite/sqflite.dart';

abstract class SavedBookLocalDataSource {
  Future<int> insertBook(SavedBookModelDao book);

  Future<List<SavedBookModelDao>> getAllBooks();
}

class SavedBookLocalDataSourceImpl implements SavedBookLocalDataSource {
  final Database db;

  SavedBookLocalDataSourceImpl(this.db);

  @override
  Future<int> insertBook(SavedBookModelDao book) async {
    return await db.insert(
      "saved_books",
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<SavedBookModelDao>> getAllBooks() async {
    final result = await db.query("saved_books");
    return result.map((map) => SavedBookModelDao.fromJson(map)).toList();
  }
}
