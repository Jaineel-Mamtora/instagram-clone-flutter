import 'package:equatable/equatable.dart';

sealed class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class LoginWithEmailAndPassword extends LoginEvent {}
