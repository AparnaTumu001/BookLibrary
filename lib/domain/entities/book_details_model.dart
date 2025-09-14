import 'package:equatable/equatable.dart';

class BookDetailsModel extends Equatable {
  var description;
  String? title;
  List? covers;
  List? subjectPlaces;
  List? subjects;
  List? subjectPeople;
  String? key;
  List? authors;
  var type;
  String? firstPublishDate;
  int? latestRevision;
  int? revision;
  var created;
  var lastModified;

  BookDetailsModel({
    this.description,
    this.title,
    this.covers,
    this.subjectPlaces,
    this.subjects,
    this.subjectPeople,
    this.key,
    this.authors,
    this.type,
    this.firstPublishDate,
    this.latestRevision,
    this.revision,
    this.created,
    this.lastModified,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    description,
    title,
    covers,
    subjectPlaces,
    subjects,
    subjectPeople,
    key,
    authors,
    type,
    firstPublishDate,
    latestRevision,
    revision,
    created,
    lastModified,
  ];
}
