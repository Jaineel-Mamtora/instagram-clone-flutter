import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:instagram_clone/common/models/profile_details.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post extends Equatable {
  final ProfileDetails postedBy;
  final List<String> imageUrls;

  final DateTime createdOn;
  final String? postContent;
  final int likeCount;
  final List<String>? comments;
  final bool isSaved;
  final List<String>? hashtags;

  Post({
    required this.postedBy,
    required this.imageUrls,
    required this.createdOn,
    this.postContent,
    this.likeCount = 0,
    this.comments,
    this.isSaved = false,
    this.hashtags,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  List<Object?> get props => [postedBy, createdOn];
}
