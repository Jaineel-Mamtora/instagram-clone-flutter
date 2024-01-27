import 'package:flutter/material.dart' show immutable;

import 'package:equatable/equatable.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();
}
