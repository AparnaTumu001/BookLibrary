import '../../domain/entities/book_details_model.dart';
import '../models/book_details_model_dao.dart';

extension BookDetailsMapper on BookDetailsModelDAO {
  BookDetailsModel toDomain() {
    return BookDetailsModel(
      description: description,
      title: title,
      covers: covers,
      subjectPlaces: subjectPlaces,
      subjects: subjects,
      subjectPeople: subjectPeople,
      key: key,
      authors: authors != null ? authors?.map((a) => a).toList() : [],
      type: type,
      firstPublishDate: firstPublishDate,
      latestRevision: latestRevision,
      revision: revision,
      created: created,
      lastModified: lastModified,
    );
  }
}
