import 'package:flutter/material.dart';

import 'package:instagram_clone/my_theme.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Tab',
        style: lightTheme.textTheme.bodyLarge,
      ),
    );
  }
}
