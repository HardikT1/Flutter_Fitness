import '../Base/base_event.dart';

class SignInRequested extends BaseEvent {
  final String? email;
  final String? password;

  const SignInRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
