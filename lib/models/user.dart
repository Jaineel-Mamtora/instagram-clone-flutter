import 'package:instagram_clone/models/content.dart';
import 'package:instagram_clone/models/profile_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final String id;
  final ProfileDetails profileDetails;
  final Content? content;

  User({
    required this.id,
    required this.profileDetails,
    this.content,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
