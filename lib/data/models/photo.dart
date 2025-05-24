import 'package:assignment_flutter/domain/entity/photo.dart';
import 'package:hive/hive.dart';
part 'photo.g.dart'; 
@HiveType(typeId: 1)
class PhotoModel extends Photo{
  @HiveField(0)
  int albumId;
  @HiveField(1)
  int id;
  @HiveField(2)
  String title;
  @HiveField(3)
  String url;
  @HiveField(4)
  String thumbnailUrl;
  PhotoModel({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl}):super(albumId: albumId,id:id,title:title,url:url,thumbnailUrl:thumbnailUrl);

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }
   @override
  String toString() {
    return 'PhotoModel(id: $id, title: $title, thumbnailUrl: $thumbnailUrl)';
  }
}