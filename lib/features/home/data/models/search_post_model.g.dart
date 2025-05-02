// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPostModel _$SearchPostModelFromJson(Map<String, dynamic> json) =>
    SearchPostModel(
      id: json['id'] as String,
      urls: Urls.fromJson(json['urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchPostModelToJson(SearchPostModel instance) =>
    <String, dynamic>{'id': instance.id, 'urls': instance.urls};

Urls _$UrlsFromJson(Map<String, dynamic> json) =>
    Urls(small: json['small'] as String);

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
  'small': instance.small,
};
