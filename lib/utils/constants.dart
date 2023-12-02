import 'dart:ui';

class Constants {
  /// fonts
  static const String fontRoboto = 'Roboto';
  static const String fontBillabong = 'Billabong';

  /// texts
  static const String appName = 'Instagram';
  static const String notifications = 'Notifications';
  static const String messages = 'Messages';
  static const String home = 'Home';
  static const String search = 'Search';
  static const String post = 'Post';
  static const String reels = 'Reels';
  static const String profile = 'Profile';
  static const String loginButtonText = 'Log In';
  static const String forgotPasswordButtonText = 'Forgotten Password?';
  static const String createNewAccountButtonText = 'Create new account';

  static const String emailHintText = 'Email';
  static const String passwordHintText = 'Password';
  static const String passwordEmptyErrorText = 'Please enter your password.';
  static const String emailEmptyErrorText = 'Please enter your email.';
  static const String emailRegExpMismatchErrorText =
      'Enter a valid email address.';
  static const String passwordRegExpMismatchErrorText =
      'Password should contain atleast one uppercase letter, one digit, '
      'one special character and should be at least 8 characters long.';

  /// Regular expression to ensure that the password contains
  /// at least one uppercase letter,
  /// one digit,
  /// one special character,
  /// and is at least 8 characters long.
  static const passwordRegex =
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

  static const emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';

  /// svg image paths
  static const String pathToLikeUnselectedLightThemeSvg =
      'assets/icons/like_unselected_light_theme.svg';
  static const String pathToMessengerLightThemeSvg =
      'assets/icons/messenger_light_theme.svg';
  static const String pathToHomeUnselectedLightThemeSvg =
      'assets/icons/home_unselected_light_theme.svg';
  static const String pathToHomeSelectedLightThemeSvg =
      'assets/icons/home_selected_light_theme.svg';
  static const String pathToSearchUnselectedLightThemeSvg =
      'assets/icons/search_unselected_light_theme.svg';
  static const String pathToSearchSelectedLightThemeSvg =
      'assets/icons/search_selected_light_theme.svg';
  static const String pathToAddPostLightThemeSvg =
      'assets/icons/add_post_light_theme.svg';
  static const String pathToReelsMenuUnselectedLightThemeSvg =
      'assets/icons/reels_menu_unselected_light_theme.svg';
  static const String pathToReelsMenuSelectedLightThemeSvg =
      'assets/icons/reels_menu_selected_light_theme.svg';
  static const String pathToProfileUnselectedLightThemeSvg =
      'assets/icons/profile_unselected_light_theme.svg';
  static const String pathToProfileSelectedLightThemeSvg =
      'assets/icons/profile_selected_light_theme.svg';
  static const String pathToInstagramLogoSvg =
      'assets/icons/instagram_logo.svg';
  static const String pathToMetaLogoSvg = 'assets/icons/meta_logo.svg';
}

/// Colors
class MyColors {
  static const gradientColors = <Color>[
    Color(0xFFFEDA77),
    Color(0xFFF58529),
    Color(0xFFDD2A7B),
    Color(0xFF8134AF),
    Color(0xFF515BD4),
  ];

  static const storiesBorderGradientColors = <Color>[
    Color(0xFFFEDA77),
    Color(0xFFF58529),
    Color(0xFFDD2A7B),
    Color(0xFF8134AF),
  ];

  static const loginBackgroundGradientColors = <Color>[
    Color(0xFFFFFBF2),
    Color(0xFFFAF1FC),
    Color(0xFFEEF7FE),
    Color(0xFFEFFBF3),
  ];

  static const loginButtonColor = Color(0xFF0064E1);
  static const metaTextColor = Color(0xFF09244B);
}
