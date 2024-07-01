import 'package:bloc/bloc.dart';
import 'package:fitness_app/bloc/signup_bloc/signup_event.dart';
import 'package:fitness_app/bloc/signup_bloc/signup_state.dart';

class SignUpBloc extends Bloc<PageChangedEvent, SignUpInitial> {
  SignUpBloc() : super(const SignUpInitial(currentPage: 0)) {
    on<PageChangedEvent>((event, emit) {
      return emit(SignUpInitial(currentPage: event.currentPage));
    });
  }
}
