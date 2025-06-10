import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/registeration/data/models/user_model.dart';
import 'package:store/features/registeration/data/services/auth_services.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authServices) : super(AuthInitial());

  final AuthServices authServices ;

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      final user = await authServices.lgoinWithEmailAndPassword(
        email,
        password,
      );

      if (user != null) {
        emit(LoginSuccessState());
      } else {
        emit(LoginFailedState("Incorect credential !!"));
      }
    } catch (e) {
      emit(LoginFailedState(e.toString()));
    }
  }

  Future<void> signup(String email, String password, String name) async {
    emit(SignupLoadingState());
    try {
      final user = await authServices.signUpWithEmailAndPassword(
        email,
        password,
      );
      if (user != null) {
        emit(SignupSuccessState()); 
        final userData = UserModel(name: name, uid: user.uid, email: email);
        await authServices.setUserData(userData);
      } else {
        emit(SignupFailedState("Incorect credential !!"));
      }
    } catch (e) {
      emit(SignupFailedState(e.toString()));
    }
  }

  void authStatus() {
    final user = authServices.currentUser;
    if (user != null) {
      emit(LoginSuccessState());
    } else {
      emit(AuthInitial());
    }
  }

  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {
      await authServices.logout();
      emit(AuthInitial());
    } catch (e) {
      emit(LogoutFailedState(e.toString()));
    }
  } 
}
