// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      groupId: json['groupId'] as String,
      conversationWith: ProfileDetails.fromJson(
          json['conversationWith'] as Map<String, dynamic>),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'conversationWith': instance.conversationWith.toJson(),
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };
