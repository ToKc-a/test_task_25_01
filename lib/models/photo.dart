class Photo {
  final int _albumId;
  final int _id;
  final String _title;
  final String _url;
  final String _thumbnailUrl;

  int get albumId => _albumId;

  int get id => _id;

  String get title => _title;

  String get url => _url;

  String get thumbnailUrl => _thumbnailUrl;

  Photo.fromJson(Map<String, dynamic> json)
      : this._albumId = json['albumId'],
        this._id = json['id'],
        this._title = json['title'],
        this._url = json['url'],
        this._thumbnailUrl = json['thumbnailUrl'];
}

class PhotoList {
  final List<Photo> photos = [];

  PhotoList.fromJson(List<dynamic> jsonItems) {
    for (var jsonItem in jsonItems) {
      photos.add(Photo.fromJson(jsonItem));
    }
  }
}

abstract class PhotoResult {}

class PhotoResultSucess extends PhotoResult {
  final PhotoList photoList;

  PhotoResultSucess(this.photoList);
}

class PhotoResultFailure extends PhotoResult {
  final String error;

  PhotoResultFailure(this.error);
}

class PhotoResultLoading extends PhotoResult {
  PhotoResultLoading();
}
