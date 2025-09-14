import 'package:equatable/equatable.dart';

class BooksListModel extends Equatable {
  int? numFound;
  int? start;
  bool? numFoundExact;
  String? documentationUrl;
  String? q;
  var offset;
  List<DocsModel>? docs;

  BooksListModel({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.documentationUrl,
    this.q,
    this.offset,
    this.docs,
  });

  @override
  List<Object?> get props => [
    this.numFound,
    this.start,
    this.numFoundExact,
    this.numFoundExact,
    this.documentationUrl,
    this.q,
    this.offset,
    this.docs,
  ];
}

class DocsModel extends Equatable {
  List<String>? authorKey;
  List<String>? authorName;
  String? coverEditionKey;
  int? coverI;
  String? ebookAccess;
  int? editionCount;
  int? firstPublishYear;
  bool? hasFulltext;
  String? lendingEditionS;
  String? lendingIdentifierS;
  bool? publicScanB;
  String? title;
  String? key;

  DocsModel({
    this.authorKey,
    this.authorName,
    this.coverEditionKey,
    this.coverI,
    this.ebookAccess,
    this.editionCount,
    this.firstPublishYear,
    this.hasFulltext,
    this.lendingEditionS,
    this.lendingIdentifierS,
    this.publicScanB,
    this.title,
    this.key
  });

  @override
  List<Object?> get props => [
    this.authorKey,
    this.authorName,
    this.coverEditionKey,
    this.coverI,
    this.ebookAccess,
    this.editionCount,
    this.firstPublishYear,
    this.hasFulltext,
    this.lendingEditionS,
    this.lendingIdentifierS,
    this.publicScanB,
    this.title,
    this.key
  ];
}
