import 'package:flutter/material.dart';

import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: media.size.width * (16 / media.size.width),
        right: media.size.width * (16 / media.size.width),
      ),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          maximumSize: Size(
            media.size.width,
            media.size.height * (55 / media.size.height),
          ),
          minimumSize: Size(
            media.size.width,
            media.size.height * (55 / media.size.height),
          ),
          side: BorderSide(
            color: MyColors.loginButtonColor,
            width: 1.5,
          ),
        ),
        child: Text(
          Constants.createNewAccountButtonText,
          style: lightTheme.textTheme.bodyLarge?.copyWith(
            letterSpacing: 1.1,
            color: MyColors.loginButtonColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
