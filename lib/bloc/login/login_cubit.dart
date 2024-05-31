import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nusantara_news_app/bloc/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) async {
    try {
      emit(LoginLoading());
      // Simulasikan proses login
      await Future.delayed(const Duration(seconds: 2));
      // Gantilah ini dengan logika login sebenarnya
      if (email == 'nusantara@gmail.com' && password == '12345678') {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(error: 'Invalid email or password'));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
