import 'package:flutter/material.dart' show immutable;

import 'package:equatable/equatable.dart';

@immutable
sealed class SignupState extends Equatable {
  const SignupState();
}

final class SignupPasswordVisible extends SignupState {
  const SignupPasswordVisible();

  @override
  List<Object?> get props => [];
}

final class SignupPasswordObscure extends SignupState {
  const SignupPasswordObscure();

  @override
  List<Object?> get props => [];
}
