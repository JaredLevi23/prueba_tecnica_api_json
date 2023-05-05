
/*
 * AlbumModel
 * Shows the structure of the model
 */

import 'dart:convert';
import 'photo_model.dart';

class AlbumModel {

    int userId;
    int id;
    String title;
    List<PhotoModel>? photos;

    AlbumModel({
        required this.userId,
        required this.id,
        required this.title,
        this.photos = const []
    });

    factory AlbumModel.fromRawJson(String str) => AlbumModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
    };
}
