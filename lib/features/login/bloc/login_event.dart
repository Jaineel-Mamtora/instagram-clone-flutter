import 'package:flutter/material.dart' show immutable;

import 'package:equatable/equatable.dart';

@immutable
sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

final class LoginTogglePasswordVisibility extends LoginEvent {
  const LoginTogglePasswordVisibility();

  @override
  List<Object?> get props => [];
}
