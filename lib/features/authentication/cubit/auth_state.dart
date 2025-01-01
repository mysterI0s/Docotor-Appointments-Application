import '../models/login_model.dart';
import '../models/register_model.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  LoginModel model;
  LoginSuccessState({
    required this.model,
  });
}

class LoginErrorState extends AuthState {
  String errorMsg;
  LoginErrorState(this.errorMsg);
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  RegisterModel model;
  RegisterSuccessState({required this.model});
}

class RegisterErrorState extends AuthState {
  String errorMsg;
  RegisterErrorState(this.errorMsg);
}

class LogoutLoadingState extends AuthState {}

class LogoutSuccessState extends AuthState {}

class LogoutErrorState extends AuthState {
  String errorMsg;
  LogoutErrorState(this.errorMsg);
}
