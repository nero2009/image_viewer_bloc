class Images {
  String id;
  Urls urls;
  String description;

  Images(this.id, this.urls, this.description);

  Images.fromJson(Map parsedJson) {
    id = parsedJson['id'];
    urls = Urls.fromJson(parsedJson['urls']);
    description = parsedJson['description'];
  }
}

class Urls {
  String thumb;
  String small;

  Urls({this.small, this.thumb});

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(small: json['small'], thumb: json['thumb']);
  }
}
