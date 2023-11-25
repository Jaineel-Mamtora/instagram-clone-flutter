// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      id: json['id'] as String,
      postedBy:
          ProfileDetails.fromJson(json['postedBy'] as Map<String, dynamic>),
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      viewCount: json['viewCount'] as int? ?? 0,
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'id': instance.id,
      'postedBy': instance.postedBy.toJson(),
      'imageUrls': instance.imageUrls,
      'viewCount': instance.viewCount,
    };
