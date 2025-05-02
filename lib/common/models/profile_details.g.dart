// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDetails _$ProfileDetailsFromJson(Map<String, dynamic> json) =>
    ProfileDetails(
      email: json['email'] as String?,
      username: json['username'] as String?,
      profilePhotoUrl: json['profilePhotoUrl'] as String?,
      bio: json['bio'] as String?,
      followersCount: (json['followersCount'] as num?)?.toInt() ?? 0,
      followingCount: (json['followingCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProfileDetailsToJson(ProfileDetails instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'profilePhotoUrl': instance.profilePhotoUrl,
      'bio': instance.bio,
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
    };
