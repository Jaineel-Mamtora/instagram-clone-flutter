import 'package:flutter/material.dart' show immutable;

import 'package:equatable/equatable.dart';

@immutable
sealed class SignupEvent extends Equatable {
  const SignupEvent();
}

final class SignUpButtonClicked extends SignupEvent {
  const SignUpButtonClicked({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email];
}
