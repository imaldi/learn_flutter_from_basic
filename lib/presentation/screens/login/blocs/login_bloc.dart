import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter_from_basic/model/user.dart';
import 'package:learn_flutter_from_basic/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserService userService;
  LoginBloc({required this.userService}) : super(LoginInitial()) {
    on<UserLoginEvent>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 1));
      // TODO: implement call authentication service
      var user = await userService.authenticateUser(event.username, event.password);
      if(user != null){
        var prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLogin", true);
        var savedValue = prefs.getBool("isLogin");
        print("savedValue: $savedValue");
        emit(LoginSuccess(user));
      } else {
        emit(LoginFailed());
      }
    });
  }
}
