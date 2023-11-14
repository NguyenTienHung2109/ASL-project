class VideoDataModel {
  int? id;
  String? title;
  String? videoURL;

  VideoDataModel(this.id, this.title, this.videoURL);
  VideoDataModel.fromJson (Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videoURL = json['videoURL'];
  }
}