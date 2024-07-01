import 'package:bloc/bloc.dart';
import '../../data/repositories/auth_repository.dart';
import '../Base/base_event.dart';
import '../base/base_state.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<BaseEvent, BaseState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<SignInRequested>((event, emit) async {
      emit(BaseLoadingState());
      try {
        emit(Authenticated());
      } catch (e) {
        emit(BaseErrorState(e.toString()));
        emit(UnAuthenticated());
      }
    });
  }
}
