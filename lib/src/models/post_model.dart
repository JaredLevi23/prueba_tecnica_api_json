
/*
 * PostModel
 * Shows the structure of the model 
 */

import 'dart:convert';
import 'package:prueba_tecnica/src/models/models.dart';

class PostModel {
    int userId;
    int id;
    String title;
    String body;
    List<CommentModel>? comments;

    PostModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
        this.comments
    });

    factory PostModel.fromRawJson(String str) => PostModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
