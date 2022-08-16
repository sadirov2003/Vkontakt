import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class NewsModel {
  final String title;
  final String? author;
  final String? description;
  final String url;
  final String? urlToImage;
  final String? context;

  NewsModel({
    required this.title,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.context,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return _$NewsModelFromJson(json);
  }
}
