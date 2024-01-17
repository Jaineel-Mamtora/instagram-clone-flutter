import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/utils/constants.dart';

class SessionDetails {
  Future<bool> getLoginStatus() async {
    return sharedPreferences.getBool(SharedPreferenceConstants.isLoggedInKey) ??
        false;
  }

  Future<void> userSignUp({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (UserCredential credential) {
          sharedPreferences.setString(
              SharedPreferenceConstants.userEmailKey, email);
          sharedPreferences.setString(
              SharedPreferenceConstants.userPasswordKey, password);
        },
      );
    } catch (e) {
      Logger().d(e);
    }
  }
}
