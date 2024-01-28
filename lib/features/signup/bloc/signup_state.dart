import 'package:flutter/material.dart' show immutable;

import 'package:equatable/equatable.dart';

@immutable
sealed class SignupState extends Equatable {
  const SignupState();
}

final class Init extends SignupState {
  const Init();

  @override
  List<Object?> get props => [];
}

final class StartLoading extends SignupState {
  const StartLoading();

  @override
  List<Object?> get props => [];
}

final class StopLoading extends SignupState {
  const StopLoading();

  @override
  List<Object?> get props => [];
}

final class Done extends SignupState {
  const Done();

  @override
  List<Object?> get props => [];
}

final class Error extends SignupState {
  const Error({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
