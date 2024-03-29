import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:instagram_clone/common/models/message.dart';
import 'package:instagram_clone/common/models/profile_details.dart';

part 'conversation.g.dart';

@JsonSerializable(explicitToJson: true)
class Conversation extends Equatable {
  /// [groupId] : for distinguishing between the messages which are part of
  /// two different users
  final String groupId;
  final ProfileDetails conversationWith;
  final List<Message> messages;

  Conversation({
    required this.groupId,
    required this.conversationWith,
    required this.messages,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  @override
  List<Object?> get props => [groupId];
}
