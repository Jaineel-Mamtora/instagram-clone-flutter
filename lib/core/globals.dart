import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
late double deviceWidth;
late double deviceHeight;
late double deviceTopPadding;
late double deviceBottomPadding;
bool isLoggedIn = false;

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
