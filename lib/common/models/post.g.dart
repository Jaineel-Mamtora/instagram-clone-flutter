// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
  id: json['id'] as String,
  postedBy: ProfileDetails.fromJson(json['postedBy'] as Map<String, dynamic>),
  imageUrls:
      (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
  createdOn: Utility.timestampToDateTime(json['createdOn'] as Timestamp),
  likedBy:
      (json['likedBy'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  postContent: json['postContent'] as String?,
  comments:
      (json['comments'] as List<dynamic>?)?.map((e) => e as String).toList(),
  isSaved: json['isSaved'] as bool? ?? false,
  hashtags:
      (json['hashtags'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
  'id': instance.id,
  'postedBy': instance.postedBy.toJson(),
  'imageUrls': instance.imageUrls,
  'createdOn': Utility.dateTimeToTimestamp(instance.createdOn),
  'postContent': instance.postContent,
  'likedBy': instance.likedBy,
  'comments': instance.comments,
  'isSaved': instance.isSaved,
  'hashtags': instance.hashtags,
};
