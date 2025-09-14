import 'package:equatable/equatable.dart';

class SavedBookModel extends Equatable {
  final String? id;
  final String title;
  final String authorName;
  final String imageLink;

  SavedBookModel({
    this.id,
    required this.title,
    required this.authorName,
    required this.imageLink,
  });

  @override
  List<Object?> get props => [id, title, authorName, imageLink];
}
