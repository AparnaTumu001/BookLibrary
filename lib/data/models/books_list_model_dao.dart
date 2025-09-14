class BooksListModelDAO {
  final int? numFound;
  final int? start;
  final bool? numFoundExact;
  final String? documentationUrl;
  final String? q;
  final dynamic offset;
  final List<DocsModelDAO>? docs;

  BooksListModelDAO({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.documentationUrl,
    this.q,
    this.offset,
    this.docs,
  });

  factory BooksListModelDAO.fromJson(Map<String, dynamic> json) {
    return BooksListModelDAO(
      numFound: json['numFound'],
      start: json['start'],
      numFoundExact: json['numFoundExact'],
      documentationUrl: json['documentation_url'],
      q: json['q'],
      offset: json['offset'],
      docs: (json['docs'] as List<dynamic>?)
          ?.map((e) => DocsModelDAO.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numFound': numFound,
      'start': start,
      'numFoundExact': numFoundExact,
      'documentation_url': documentationUrl,
      'q': q,
      'offset': offset,
      'docs': docs?.map((e) => e.toJson()).toList(),
    };
  }
}

class DocsModelDAO {
  final List<String>? authorKey;
  final List<String>? authorName;
  final String? coverEditionKey;
  final int? coverI;
  final String? ebookAccess;
  final int? editionCount;
  final int? firstPublishYear;
  final bool? hasFulltext;
  final String? lendingEditionS;
  final String? lendingIdentifierS;
  final bool? publicScanB;
  final String? title;
  final String? key;

  DocsModelDAO({
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
    this.key,
  });

  factory DocsModelDAO.fromJson(Map<String, dynamic> json) {
    return DocsModelDAO(
      authorKey: (json['author_key'] as List?)?.cast<String>(),
      authorName: (json['author_name'] as List?)?.cast<String>(),
      coverEditionKey: json['cover_edition_key'],
      coverI: json['cover_i'],
      ebookAccess: json['ebook_access'],
      editionCount: json['edition_count'],
      firstPublishYear: json['first_publish_year'],
      hasFulltext: json['has_fulltext'],
      lendingEditionS: json['lending_edition_s'],
      lendingIdentifierS: json['lending_identifier_s'],
      publicScanB: json['public_scan_b'],
      title: json['title'],
      key: json['key'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author_key': authorKey,
      'author_name': authorName,
      'cover_edition_key': coverEditionKey,
      'cover_i': coverI,
      'ebook_access': ebookAccess,
      'edition_count': editionCount,
      'first_publish_year': firstPublishYear,
      'has_fulltext': hasFulltext,
      'lending_edition_s': lendingEditionS,
      'lending_identifier_s': lendingIdentifierS,
      'public_scan_b': publicScanB,
      'title': title,
      'key': key,
    };
  }
}
