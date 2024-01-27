import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

import 'package:instagram_clone/common_widgets/custom_snackbar.dart';
import 'package:instagram_clone/common_widgets/loader.dart';
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

  Future<bool> userSignUp(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    LoaderManager().showLoader(context);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      LoaderManager().hideLoader();
      return true;
    } on FirebaseAuthException catch (e) {
      LoaderManager().hideLoader();
      if (e.code == 'email-already-in-use') {
        hideSnackBar();
        showSnackBar(message: 'Account already exists for the email.');
      } else if (e.code == 'too-many-requests') {
        hideSnackBar();
        showSnackBar(
            message: 'Signup temporarily disabled. Too many signup attempts.');
      }
      return false;
    } catch (e) {
      sharedPreferences.remove(SharedPreferenceConstants.userEmailKey);
      sharedPreferences.remove(SharedPreferenceConstants.userPasswordKey);
      Logger().d(e);
      LoaderManager().hideLoader();
      hideSnackBar();
      showSnackBar(message: 'Something went wrong!');
      return false;
    }
  }

  Future<bool> userLogin(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    LoaderManager().showLoader(context);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => LoaderManager().hideLoader(),
          );
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint('Jaineel -> ${e.code}');
      LoaderManager().hideLoader();
      if (e.code == 'INVALID_LOGIN_CREDENTIALS' ||
          e.code == 'invalid-credential') {
        hideSnackBar();
        showSnackBar(message: 'Incorrect email or password.');
      }
      if (e.code == 'user-not-found') {
        hideSnackBar();
        showSnackBar(message: 'No user found for this email.');
      } else if (e.code == 'wrong-password') {
        hideSnackBar();
        showSnackBar(message: 'Password is incorrect.');
      } else if (e.code == 'too-many-requests') {
        hideSnackBar();
        showSnackBar(
            message: 'Login temporarily disabled. Too many login attempts.');
      }
      return false;
    } catch (e) {
      sharedPreferences.remove(SharedPreferenceConstants.userEmailKey);
      sharedPreferences.remove(SharedPreferenceConstants.userPasswordKey);
      Logger().d(e);
      LoaderManager().hideLoader();
      hideSnackBar();
      showSnackBar(message: 'Something went wrong!');
      return false;
    }
  }
}
