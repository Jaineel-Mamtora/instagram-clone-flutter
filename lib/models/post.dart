import 'package:json_annotation/json_annotation.dart';

import 'package:instagram_clone/models/profile_details.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post {
  final String id;
  final ProfileDetails postedBy;
  final List<String> imageUrls;
  final String? postContent;
  final int likeCount;
  final List<String>? comments;
  final bool isSaved;
  final List<String>? hashtags;

  Post({
    required this.id,
    required this.postedBy,
    required this.imageUrls,
    this.postContent,
    this.likeCount = 0,
    this.comments,
    this.isSaved = false,
    this.hashtags,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
