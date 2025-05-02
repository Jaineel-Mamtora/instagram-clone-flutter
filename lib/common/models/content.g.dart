// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
  posts:
      (json['posts'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
  stories:
      (json['stories'] as List<dynamic>?)
          ?.map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
  conversations:
      (json['conversations'] as List<dynamic>?)
          ?.map((e) => Conversation.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
  'posts': instance.posts?.map((e) => e.toJson()).toList(),
  'stories': instance.stories?.map((e) => e.toJson()).toList(),
  'conversations': instance.conversations?.map((e) => e.toJson()).toList(),
};
