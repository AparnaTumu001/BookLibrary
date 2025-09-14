import '../../domain/entities/books_list_model.dart';
import '../models/books_list_model_dao.dart';

extension DocsMapper on DocsModelDAO {
  DocsModel toDomain() {
    return DocsModel(
      authorKey: authorKey,
      authorName: authorName,
      coverEditionKey: coverEditionKey,
      coverI: coverI,
      ebookAccess: ebookAccess,
      editionCount: editionCount,
      firstPublishYear: firstPublishYear,
      hasFulltext: hasFulltext,
      lendingEditionS: lendingEditionS,
      lendingIdentifierS: lendingIdentifierS,
      publicScanB: publicScanB,
      title: title,
      key: key
    );
  }
}

extension BooksListMapper on BooksListModelDAO {
  BooksListModel toDomain() {
    return BooksListModel(
      numFound: numFound,
      start: start,
      numFoundExact: numFoundExact,
      documentationUrl: documentationUrl,
      q: q,
      offset: offset,
      docs: docs?.map((docDao) => docDao.toDomain()).toList() ?? [],
    );
  }
}
