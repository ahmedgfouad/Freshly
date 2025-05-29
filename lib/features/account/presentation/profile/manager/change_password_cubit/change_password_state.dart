sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoadingState extends ChangePasswordState {}

final class ChangePasswordSuccessState extends ChangePasswordState {}

final class ChangePasswordFailesState extends ChangePasswordState {
  final String error;

  ChangePasswordFailesState(this.error);
}
