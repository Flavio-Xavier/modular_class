

import 'package:bloc/bloc.dart';
import 'package:modular_class/src/modules/auth/blocs/events/login_event.dart';
import 'package:modular_class/src/modules/auth/blocs/states/login_state.dart';
import 'package:modular_class/src/modules/auth/repositories/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{

  final LoginRepository loginRepository;
  final SharedPreferences shared;

  LoginBloc(this.loginRepository, this.shared) : super(LoginIdle()){
    on<LoginWithEmail>(loginEmail);
  }

  Future loginEmail(LoginWithEmail event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 1));
    try{
      await loginRepository.login(event.email, event.password);
      emit(LoginSuccess());
      shared.setBool('isLogged', true);
    } catch (e) {
      emit(LoginFailure('Erro na senha ou no email'));
    }
  }
}