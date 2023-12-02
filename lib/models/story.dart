import 'package:equatable/equatable.dart';
import 'package:instagram_clone/models/profile_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story.g.dart';

@JsonSerializable(explicitToJson: true)
class Story extends Equatable {
  final ProfileDetails postedBy;
  final List<String> imageUrls;
  final int viewCount;

  Story({
    required this.postedBy,
    required this.imageUrls,
    this.viewCount = 0,
  });

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  Map<String, dynamic> toJson() => _$StoryToJson(this);

  @override
  List<Object?> get props => [postedBy];
}
