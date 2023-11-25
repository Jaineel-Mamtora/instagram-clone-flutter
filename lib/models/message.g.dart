// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as String,
      messageText: json['messageText'] as String,
      timeStamp: json['timeStamp'] as String,
      isLiked: json['isLiked'] as bool? ?? false,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'messageText': instance.messageText,
      'timeStamp': instance.timeStamp,
      'isLiked': instance.isLiked,
    };
