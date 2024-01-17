import 'package:flutter/material.dart';

import 'package:instagram_clone/my_theme.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Logout',
          style: lightTheme.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
