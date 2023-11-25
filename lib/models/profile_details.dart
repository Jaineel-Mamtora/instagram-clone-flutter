import 'package:json_annotation/json_annotation.dart';

part 'profile_details.g.dart';

@JsonSerializable()
class ProfileDetails {
  final String id;
  final String name;
  final String userName;
  final String email;
  final String password;
  final String? profilePhotoUrl;
  final String? bio;
  final int followersCount;
  final int followingCount;

  ProfileDetails({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.password,
    this.profilePhotoUrl,
    this.bio,
    this.followersCount = 0,
    this.followingCount = 0,
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDetailsToJson(this);
}
