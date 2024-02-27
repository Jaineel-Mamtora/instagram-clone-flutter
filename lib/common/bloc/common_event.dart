import 'package:equatable/equatable.dart';

final class TogglePasswordVisibility extends Equatable {
  const TogglePasswordVisibility({required this.isHidden});

  final bool isHidden;

  @override
  List<Object?> get props => [];
}

final class LikeButtonClickedForPost extends Equatable {
  const LikeButtonClickedForPost({
    required this.isLiked,
    required this.id,
  });

  final bool isLiked;
  final String id;

  @override
  List<Object?> get props => [id];
}
