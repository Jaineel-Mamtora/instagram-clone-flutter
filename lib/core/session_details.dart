import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/utils/constants.dart';

class SessionDetails {
  Future<bool> getLoginStatus() async =>
      sharedPreferences.getBool(
        SharedPreferenceConstants.isLoggedInKey,
      ) ??
      false;

  Future<void> setLoginStatus({required bool status}) async {
    isLoggedIn = status;
    sharedPreferences.setBool(
      SharedPreferenceConstants.isLoggedInKey,
      status,
    );
  }

  Future<void> setUserEmail({
    required String email,
  }) async =>
      await sharedPreferences.setString(
        SharedPreferenceConstants.userEmailKey,
        email,
      );

  Future<String> getUserEmail() async =>
      sharedPreferences.getString(
        SharedPreferenceConstants.userEmailKey,
      ) ??
      '';

  Future<void> setUserPassword({
    required String password,
  }) async =>
      await sharedPreferences.setString(
        SharedPreferenceConstants.userPasswordKey,
        password,
      );

  Future<String> getUserPassword() async =>
      sharedPreferences.getString(
        SharedPreferenceConstants.userPasswordKey,
      ) ??
      '';

  Future<void> userSignUp({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      sharedPreferences.remove(SharedPreferenceConstants.userEmailKey);
      sharedPreferences.remove(SharedPreferenceConstants.userPasswordKey);
      Logger().d(e);
    }
  }
}
