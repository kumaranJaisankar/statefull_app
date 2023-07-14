// To parse this JSON data, do
//
//     final blogDataModel = blogDataModelFromJson(jsonString);

import 'dart:convert';

List<BlogDataModel> blogDataModelFromJson(String str) =>
    List<BlogDataModel>.from(
        json.decode(str).map((x) => BlogDataModel.fromJson(x)));

String blogDataModelToJson(List<BlogDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogDataModel {
  String id;
  String textBy;
  String title;
  String text;
  DateTime postedOn;
  DateTime updatedOn;

  BlogDataModel({
    required this.id,
    required this.textBy,
    required this.title,
    required this.text,
    required this.postedOn,
    required this.updatedOn,
  });

  factory BlogDataModel.fromJson(Map<String, dynamic> json) => BlogDataModel(
        id: json["id"],
        textBy: json["text_by"],
        title: json["title"],
        text: json["text"],
        postedOn: DateTime.parse(json["posted_on"]),
        updatedOn: DateTime.parse(json["updated_on"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text_by": textBy,
        "title": title,
        "text": text,
        "posted_on": postedOn.toIso8601String(),
        "updated_on": updatedOn.toIso8601String(),
      };
}
