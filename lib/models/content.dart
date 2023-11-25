import 'package:json_annotation/json_annotation.dart';

import 'package:instagram_clone/models/conversation.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/models/story.dart';

part 'content.g.dart';

@JsonSerializable(explicitToJson: true)
class Content {
  final String id;
  final List<Post>? posts;
  final List<Story>? stories;
  final List<Conversation>? conversations;

  Content({
    required this.id,
    this.posts,
    this.stories,
    this.conversations,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
