part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class UserLoginEvent extends LoginEvent {
  String username;
  String password;
  UserLoginEvent(this.username, this.password);
  @override
  List<Object?> get props => [username, password];
}
