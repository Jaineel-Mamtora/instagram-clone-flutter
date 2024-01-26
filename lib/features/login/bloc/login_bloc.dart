import 'package:bloc/bloc.dart';

import 'package:instagram_clone/features/login/bloc/login_event.dart';
import 'package:instagram_clone/features/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginPasswordObscure()) {
    on<LoginTogglePasswordVisibility>(
      (event, emit) {
        if (state is LoginPasswordVisible) {
          emit(LoginPasswordObscure());
        } else {
          emit(LoginPasswordVisible());
        }
      },
    );
  }
}
