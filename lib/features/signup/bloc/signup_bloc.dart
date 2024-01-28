import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'package:instagram_clone/common/models/user.dart';
import 'package:instagram_clone/core/session_details.dart';
import 'package:instagram_clone/features/signup/bloc/signup_event.dart';
import 'package:instagram_clone/features/signup/bloc/signup_state.dart';

class SignupBloc extends Bloc<SignUpButtonClicked, SignupState> {
  SignupBloc() : super(Init()) {
    on<SignUpButtonClicked>((event, emit) async {
      emit(StartLoading());
      try {
        await auth.FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        )
            .then((auth.UserCredential credential) async {
          if (credential.user != null) {
            await SessionDetails().setUser(
              user: User(id: credential.user!.uid),
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
        if (e.code == 'email-already-in-use') {
          emit(Error(message: 'Account already exists for the email.'));
        } else if (e.code == 'too-many-requests') {
          emit(Error(
            message: 'Signup temporarily disabled. Too many signup attempts.',
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
