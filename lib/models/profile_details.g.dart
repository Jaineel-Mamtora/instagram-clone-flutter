// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDetails _$ProfileDetailsFromJson(Map<String, dynamic> json) =>
    ProfileDetails(
      id: json['id'] as String,
      name: json['name'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      profilePhotoUrl: json['profilePhotoUrl'] as String?,
      bio: json['bio'] as String?,
      followersCount: json['followersCount'] as int? ?? 0,
      followingCount: json['followingCount'] as int? ?? 0,
    );

Map<String, dynamic> _$ProfileDetailsToJson(ProfileDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'profilePhotoUrl': instance.profilePhotoUrl,
      'bio': instance.bio,
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
    };
