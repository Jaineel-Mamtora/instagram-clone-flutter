import 'package:bloc/bloc.dart';

import 'package:instagram_clone/features/signup/bloc/signup_event.dart';
import 'package:instagram_clone/features/signup/bloc/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupPasswordObscure()) {
    on<SignupTogglePasswordVisibility>(
      (event, emit) {
        if (state is SignupPasswordVisible) {
          emit(SignupPasswordObscure());
        } else {
          emit(SignupPasswordVisible());
        }
      },
    );
  }
}
