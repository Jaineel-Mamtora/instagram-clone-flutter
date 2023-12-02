import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_details.g.dart';

@JsonSerializable()
class ProfileDetails extends Equatable {
  final String? email;
  final String? profilePhotoUrl;
  final String? bio;
  final int followersCount;
  final int followingCount;

  ProfileDetails({
    this.email,
    this.profilePhotoUrl,
    this.bio,
    this.followersCount = 0,
    this.followingCount = 0,
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDetailsToJson(this);

  @override
  List<Object?> get props => [email];
}
