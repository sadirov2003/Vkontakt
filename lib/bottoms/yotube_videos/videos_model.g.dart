// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideosModel _$VideosModelFromJson(Map<String, dynamic> json) => VideosModel(
      videoId: json['id']['videoId'] as String?,
      urlImage: json['snippet']['thumbnails']['high']['url'] as String,
      title: json['snippet']['title'],
      channelTitle: json['snippet']['channelTitle'],
      
    );

Map<String, dynamic> _$VideosModelToJson(VideosModel instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'urlImage': instance.urlImage,
    };
