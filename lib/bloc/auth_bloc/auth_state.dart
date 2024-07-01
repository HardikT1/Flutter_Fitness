import '../base/base_state.dart';

class Authenticated extends BaseState {
  @override
  List<Object?> get props => [];
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends BaseState {
  @override
  List<Object?> get props => [];
}
