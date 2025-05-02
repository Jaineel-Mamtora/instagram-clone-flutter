import 'package:flutter/material.dart' show immutable;

@immutable
class SearchPost {
  final String id;
  final String imageUrl;

  const SearchPost({required this.id, required this.imageUrl});
}
