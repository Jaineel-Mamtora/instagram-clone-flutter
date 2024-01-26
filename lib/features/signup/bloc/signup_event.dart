import 'package:flutter/material.dart' show immutable;

import 'package:equatable/equatable.dart';

@immutable
sealed class SignupEvent extends Equatable {
  const SignupEvent();
}

final class SignupTogglePasswordVisibility extends SignupEvent {
  const SignupTogglePasswordVisibility();

  @override
  List<Object?> get props => [];
}
