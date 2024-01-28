import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:logger/logger.dart';

import 'package:instagram_clone/common/models/user.dart';
import 'package:instagram_clone/common/widgets/custom_snackbar.dart';
import 'package:instagram_clone/common/widgets/loader.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/utils/constants.dart';

class SessionDetails {
  Future<void> setUserEmail({
    required String email,
  }) async =>
      await sharedPreferences.setString(
        SharedPreferenceConstants.userEmailKey,
        email,
      );

  String getUserEmail() =>
      sharedPreferences.getString(
        SharedPreferenceConstants.userEmailKey,
      ) ??
      '';

  Future<void> setUser({required User user}) async {
    final encodedUser = jsonEncode(user.toJson());
    await sharedPreferences.setString(
        SharedPreferenceConstants.userKey, encodedUser);
  }

  User getUser() {
    final encodedUser =
        sharedPreferences.getString(SharedPreferenceConstants.userKey) ?? '';
    if (encodedUser.isNotEmpty) {
      final user = User.fromJson(jsonDecode(encodedUser));
      return user;
    } else {
      return User.empty();
    }
  }

  Future<bool> userSignUp(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    LoaderManager().showLoader(context);
    try {
      await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      LoaderManager().hideLoader();
      return true;
    } on auth.FirebaseAuthException catch (e) {
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
      await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => LoaderManager().hideLoader(),
          );
      return true;
    } on auth.FirebaseAuthException catch (e) {
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
