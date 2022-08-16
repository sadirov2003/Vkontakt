import 'package:json_annotation/json_annotation.dart';
part 'friends_model.f.dart';

@JsonSerializable()
class FriendsModel {
  final int id;
  final String first_name;
  final String last_name;
  final String photo_100;

  FriendsModel({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.photo_100,
  });

  factory FriendsModel.fromJson(Map<String, dynamic> json) {
    return _$FriendsModelFromJson(json);
  }
}
