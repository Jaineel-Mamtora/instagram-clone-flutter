import 'package:flutter/material.dart' show immutable;

import 'package:json_annotation/json_annotation.dart';

import 'package:instagram_clone/features/home/domain/entities/search_post.dart';

part 'search_post_model.g.dart';

@immutable
@JsonSerializable()
class SearchPostModel {
  final String id;
  final Urls urls;

  const SearchPostModel({required this.id, required this.urls});

  factory SearchPostModel.fromJson(Map<String, dynamic> json) =>
      _$SearchPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPostModelToJson(this);

  SearchPost toEntity() => SearchPost(id: id, imageUrl: urls.small);
}

@immutable
@JsonSerializable()
class Urls {
  final String small;

  const Urls({required this.small});

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
