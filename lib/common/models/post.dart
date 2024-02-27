import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:instagram_clone/common/models/profile_details.dart';
import 'package:instagram_clone/utils/utility.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post extends Equatable {
  final String id;
  final ProfileDetails postedBy;
  final List<String> imageUrls;
  @JsonKey(
    fromJson: Utility.timestampToDateTime,
    toJson: Utility.dateTimeToTimestamp,
  )
  final DateTime createdOn;
  final String? postContent;
  final int likeCount;
  final List<String> likedBy;
  final List<String>? comments;
  final bool isSaved;
  final List<String>? hashtags;

  Post({
    required this.id,
    required this.postedBy,
    required this.imageUrls,
    required this.createdOn,
    this.likedBy = const <String>[],
    this.postContent,
    this.comments,
    this.isSaved = false,
    this.hashtags,
  }) : likeCount = likedBy.length;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  List<Object?> get props => [postedBy, createdOn];
}
