import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/account/data/services/profile_services.dart';
import 'package:store/features/account/presentation/profile/manager/change_password_cubit/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  final profireService = ProfileServicesImpl();

  Future<void> changePassword(String oldPassword , String newPassword) async {
    emit(ChangePasswordLoadingState());
    try {
      await profireService.changePassword(oldPassword,newPassword);
      emit(ChangePasswordSuccessState());
    } catch (e) {
      emit(ChangePasswordFailesState(e.toString()));
    }
  }
}
