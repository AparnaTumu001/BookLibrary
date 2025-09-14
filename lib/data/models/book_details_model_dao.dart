class BookDetailsModelDAO {
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

  BookDetailsModelDAO({
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

  BookDetailsModelDAO.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    title = json['title'];
    covers = json['covers'] ?? [];
    subjectPlaces = json['subject_places'] ?? [];
    subjects = json['subjects'] ?? [];
    subjectPeople = json['subject_people'] ?? [];
    key = json['key'];
    if (json['authors'] != null) {
      authors = [];
      json['authors'].forEach((v) {
        authors!.add(v);
      });
    }
    type = json['type'];
    firstPublishDate = json['first_publish_date'];
    latestRevision = json['latest_revision'];
    revision = json['revision'];
    created = json['created'];
    lastModified = json['last_modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['title'] = this.title;
    data['covers'] = this.covers;
    data['subject_places'] = this.subjectPlaces;
    data['subjects'] = this.subjects;
    data['subject_people'] = this.subjectPeople;
    data['key'] = this.key;
    if (this.authors != null) {
      data['authors'] = this.authors!.map((v) => v.toJson()).toList();
    }
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    data['first_publish_date'] = this.firstPublishDate;
    data['latest_revision'] = this.latestRevision;
    data['revision'] = this.revision;
    if (this.created != null) {
      data['created'] = this.created!.toJson();
    }
    if (this.lastModified != null) {
      data['last_modified'] = this.lastModified!.toJson();
    }
    return data;
  }
}
