import 'package:flutter/material.dart' show immutable;

import 'package:equatable/equatable.dart';

@immutable
sealed class LoginState extends Equatable {
  const LoginState();
}

final class Init extends LoginState {
  const Init();

  @override
  List<Object?> get props => [];
}

final class StartLoading extends LoginState {
  const StartLoading();

  @override
  List<Object?> get props => [];
}

final class StopLoading extends LoginState {
  const StopLoading();

  @override
  List<Object?> get props => [];
}

final class Done extends LoginState {
  const Done();

  @override
  List<Object?> get props => [];
}

final class Error extends LoginState {
  const Error({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
