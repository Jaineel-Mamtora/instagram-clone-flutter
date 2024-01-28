import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:instagram_clone/common/bloc/common_event.dart';

//? For toggling password visibility in textfield
class PasswordBloc extends Bloc<TogglePasswordVisibility, bool> {
  PasswordBloc() : super(true) {
    on<TogglePasswordVisibility>(
      (event, emit) {
        emit(event.isHidden);
      },
    );
  }
}
