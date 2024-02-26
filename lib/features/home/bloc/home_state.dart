import 'package:flutter/material.dart' show immutable;

import 'package:equatable/equatable.dart';
import 'package:instagram_clone/common/models/post.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();
}

final class Init extends HomeState {
  const Init();

  @override
  List<Object?> get props => [];
}

final class StartLoading extends HomeState {
  const StartLoading();

  @override
  List<Object?> get props => [];
}

final class StopLoading extends HomeState {
  const StopLoading();

  @override
  List<Object?> get props => [];
}

final class Done extends HomeState {
  const Done({required this.commonPosts});

  final List<Post> commonPosts;

  @override
  List<Object?> get props => [commonPosts];
}

final class Error extends HomeState {
  const Error({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
