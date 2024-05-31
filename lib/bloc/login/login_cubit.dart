import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../repositories/aut_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  static var nameRoute;

  LoginCubit() : super(LoginInitial());
  final _repo = AuthRepo();

  void login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await _repo.login(email: email, password: password);
      emit(LoginSuccess('Login berhasil!'));
    } catch (e) {
      print(e);
      emit(LoginFailure(e.toString()));
    }
  }
}
