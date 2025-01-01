import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/features/authentication/server_manager/auth_server_manager.dart';

import '../models/login_model.dart';
import '../models/register_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());

  AuthServerManager authServerManager = AuthServerManager();

  void register(
    String email,
    String name,
    String password,
    String confirmPassword,
  ) async {
    emit(RegisterLoadingState());
    try {
      RegisterModel x = await authServerManager.register(
          email, name, password, confirmPassword);
      emit(RegisterSuccessState(model: x));
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }

  void login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      LoginModel x = await authServerManager.login(email, password);
      emit(LoginSuccessState(model: x));
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  void logout(String token) async {
    emit(LogoutLoadingState());
    try {
      await authServerManager.logout(token);
      emit(LogoutSuccessState());
    } catch (e) {
      emit(LogoutErrorState(e.toString()));
    }
  }
}
