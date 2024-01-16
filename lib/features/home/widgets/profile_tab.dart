import 'package:flutter/material.dart';
import 'package:instagram_clone/my_theme.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Tab',
        style: lightTheme.textTheme.bodyLarge,
      ),
    );
  }
}
