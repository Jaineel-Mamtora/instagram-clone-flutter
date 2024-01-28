import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String id;
  final String messageText;
  final String timeStamp;
  final bool isLiked;

  Message({
    required this.id,
    required this.messageText,
    required this.timeStamp,
    this.isLiked = false,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
