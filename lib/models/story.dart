import 'package:json_annotation/json_annotation.dart';

import 'package:instagram_clone/models/profile_details.dart';

part 'story.g.dart';

@JsonSerializable(explicitToJson: true)
class Story {
  final String id;
  final ProfileDetails postedBy;
  final List<String> imageUrls;
  final int viewCount;

  Story({
    required this.id,
    required this.postedBy,
    required this.imageUrls,
    this.viewCount = 0,
  });

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  Map<String, dynamic> toJson() => _$StoryToJson(this);
}
