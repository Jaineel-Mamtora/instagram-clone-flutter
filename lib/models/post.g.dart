// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String,
      postedBy:
          ProfileDetails.fromJson(json['postedBy'] as Map<String, dynamic>),
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      postContent: json['postContent'] as String?,
      likeCount: json['likeCount'] as int? ?? 0,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isSaved: json['isSaved'] as bool? ?? false,
      hashtags: (json['hashtags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'postedBy': instance.postedBy.toJson(),
      'imageUrls': instance.imageUrls,
      'postContent': instance.postContent,
      'likeCount': instance.likeCount,
      'comments': instance.comments,
      'isSaved': instance.isSaved,
      'hashtags': instance.hashtags,
    };
