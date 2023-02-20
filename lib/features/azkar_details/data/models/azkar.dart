import 'dart:convert';
import 'package:musilm_app/features/azkar_details/domain/entities/azkar.dart';

List<AzkarDataModel> welcomeFromJson(String str) => List<AzkarDataModel>.from(
    json.decode(str).map((x) => AzkarDataModel.fromJson(x)));

String welcomeToJson(List<AzkarDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AzkarDataModel extends AzkarData {
  AzkarDataModel({
    required String category,
    required String count,
    required String description,
    required String reference,
    required String content,
  }) : super(
            category: category,
            count: count,
            description: description,
            reference: reference,
            content: content);

  factory AzkarDataModel.fromJson(Map<String, dynamic> json) => AzkarDataModel(
        category: json["category"],
        count: json["count"],
        description: json["description"],
        reference: json["reference"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "count": count,
        "description": description,
        "reference": reference,
        "content": content,
      };
}
