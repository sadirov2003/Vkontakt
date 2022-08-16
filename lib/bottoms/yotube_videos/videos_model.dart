import 'package:json_annotation/json_annotation.dart';

part 'videos_model.g.dart';

@JsonSerializable()
class VideosModel {
  final String? videoId;
  final String urlImage;
  final String? title;

  VideosModel({
    required this.videoId,
    required this.urlImage,
    required this.title,
  });

  factory VideosModel.fromJson(Map<String, dynamic> json) {
    return _$VideosModelFromJson(json);
  }
}
