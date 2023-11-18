// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
      profileUrl: json['profileUrl'] as String?,
      url: json['url'] as String?,
      isPostedToCloseFriends: json['isPostedToCloseFriends'] as bool?,
      isStorySeen: json['isStorySeen'] as bool?,
      showRing: json['showRing'] as bool?,
    );

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'profileUrl': instance.profileUrl,
      'url': instance.url,
      'isPostedToCloseFriends': instance.isPostedToCloseFriends,
      'isStorySeen': instance.isStorySeen,
      'showRing': instance.showRing,
    };
