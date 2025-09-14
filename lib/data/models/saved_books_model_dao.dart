import 'package:bookfinder/domain/entities/saved_books_model.dart';

class SavedBookModelDao extends SavedBookModel {
  SavedBookModelDao({
    required String? id,
    required String title,
    required String authorName,
    required String imageLink,
  }) : super(
         id: id,
         title: title,
         authorName: authorName,
         imageLink: imageLink,
       );

  factory SavedBookModelDao.fromJson(Map<String, dynamic> map) {
    return SavedBookModelDao(
      id: map['id'],
      title: map['title'],
      authorName: map['author'],
      imageLink: map['imageLink'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': authorName,
      'imageLink': imageLink,
    };
  }
}
