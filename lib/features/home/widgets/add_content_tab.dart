import 'package:flutter/material.dart';

import 'package:instagram_clone/my_theme.dart';

class AddContentTab extends StatelessWidget {
  const AddContentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Add Content Tab',
        style: lightTheme.textTheme.bodyLarge,
      ),
    );
  }
}
