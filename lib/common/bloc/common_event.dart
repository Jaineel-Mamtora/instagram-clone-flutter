import 'package:equatable/equatable.dart';

final class TogglePasswordVisibility extends Equatable {
  const TogglePasswordVisibility({required this.isHidden});

  final bool isHidden;

  @override
  List<Object?> get props => [];
}
