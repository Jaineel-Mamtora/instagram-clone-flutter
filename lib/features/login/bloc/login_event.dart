import 'package:flutter/material.dart' show immutable;

import 'package:equatable/equatable.dart';

@immutable
sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

final class LoginButtonClicked extends LoginEvent {
  const LoginButtonClicked({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email];
}
