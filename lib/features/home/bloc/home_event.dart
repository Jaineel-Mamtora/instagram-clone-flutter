import 'package:flutter/material.dart' show immutable;

import 'package:equatable/equatable.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class ChangeHomeTabIndex extends HomeEvent {
  const ChangeHomeTabIndex({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}

final class FetchCommonPosts extends HomeEvent {
  const FetchCommonPosts();

  @override
  List<Object?> get props => [];
}
