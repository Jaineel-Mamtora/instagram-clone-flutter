import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:instagram_clone/common/widgets/custom_button.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/my_theme.dart';

class AddContentTab extends StatelessWidget {
  const AddContentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: deviceHeight * 0.02),
            child: CustomButton(
              title: 'Add Random Post',
              size: Size(deviceWidth / 2.5, deviceHeight * 0.06),
              borderColor: lightTheme.colorScheme.secondary.withOpacity(0.3),
              borderRadius: deviceWidth * 0.02,
              textStyle: lightTheme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              onPressed: () async {
                final url = await FirebaseStorage.instance
                    .ref('images/cycle_music.jpg')
                    .getDownloadURL();
                debugPrint('Jaineel -> $url');
              },
            ),
          ),
        ),
      ],
    );
  }
}
