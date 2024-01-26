import 'package:flutter/material.dart' show immutable;

import 'package:equatable/equatable.dart';

@immutable
sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginPasswordVisible extends LoginState {
  const LoginPasswordVisible();

  @override
  List<Object?> get props => [];
}

final class LoginPasswordObscure extends LoginState {
  const LoginPasswordObscure();

  @override
  List<Object?> get props => [];
}
