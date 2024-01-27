import 'package:bloc/bloc.dart';

import 'package:instagram_clone/features/home/bloc/home_event.dart';

class HomeBloc extends Bloc<HomeEvent, int> {
  HomeBloc() : super(0) {
    on<ChangeHomeTabIndex>((event, emit) {
      emit(event.index);
    });
  }
}
