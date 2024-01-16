import 'package:flutter/material.dart';
import 'package:instagram_clone/my_theme.dart';

class ReelsTab extends StatelessWidget {
  const ReelsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Reels Tab',
        style: lightTheme.textTheme.bodyLarge,
      ),
    );
  }
}
