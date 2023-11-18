import 'package:json_annotation/json_annotation.dart';

part 'image_data.g.dart';

@JsonSerializable()
class ImageData {
  final String? profileUrl;
  final String? url;
  final bool? isPostedToCloseFriends;
  final bool? isStorySeen;
  final bool? showRing;

  ImageData({
    this.profileUrl,
    this.url,
    this.isPostedToCloseFriends,
    this.isStorySeen,
    this.showRing,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDataToJson(this);
}
