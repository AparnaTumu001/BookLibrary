import '../../domain/entities/saved_books_model.dart';
import '../models/saved_books_model_dao.dart';

class SavedBookMapper {
  static SavedBookModelDao toDao(SavedBookModel model) {
    return SavedBookModelDao(
      id: model.id,
      title: model.title,
      authorName: model.authorName,
      imageLink: model.imageLink,
    );
  }

  static SavedBookModel fromDao(SavedBookModelDao dao) {
    return SavedBookModel(
      id: dao.id,
      title: dao.title,
      authorName: dao.authorName,
      imageLink: dao.imageLink,
    );
  }


  static List<SavedBookModel> fromDaoList(List<SavedBookModelDao> list) {
    return list.map((dao) => fromDao(dao)).toList();
  }


  static List<SavedBookModelDao> toDaoList(List<SavedBookModel> list) {
    return list.map((model) => toDao(model)).toList();
  }
}
