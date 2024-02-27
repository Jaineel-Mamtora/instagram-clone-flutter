import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/common/models/profile_details.dart';
import 'package:logger/logger.dart';

import 'package:instagram_clone/common/models/user.dart';
import 'package:instagram_clone/core/session_details.dart';
import 'package:instagram_clone/features/login/bloc/login_event.dart';
import 'package:instagram_clone/features/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginButtonClicked, LoginState> {
  LoginBloc() : super(Init()) {
    on<LoginButtonClicked>((event, emit) async {
      emit(StartLoading());
      try {
        await auth.FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        )
            .then((auth.UserCredential credential) async {
          if (credential.user != null) {
            await SessionDetails().setUser(
              user: User(
                id: credential.user!.uid,
                profileDetails: ProfileDetails(
                  email: event.email,
                ),
              ),
            );
            emit(StopLoading());
            emit(Done());
          } else {
            emit(StopLoading());
            emit(Error(message: 'Something went wrong!'));
          }
        });
      } on auth.FirebaseAuthException catch (e) {
        emit(StopLoading());
        if (e.code == 'INVALID_LOGIN_CREDENTIALS' ||
            e.code == 'invalid-credential') {
          emit(Error(message: 'Incorrect email or password.'));
        } else if (e.code == 'user-not-found') {
          emit(Error(
            message: 'No user found for this email.',
          ));
        } else if (e.code == 'wrong-password') {
          emit(Error(message: 'Password is incorrect.'));
        } else if (e.code == 'too-many-requests') {
          emit(Error(
            message: 'Login temporarily disabled. Too many login attempts.',
          ));
        }
      } catch (e) {
        emit(StopLoading());
        Logger().d(e);
        emit(Error(message: 'Something went wrong!'));
      }
    });
  }
}
