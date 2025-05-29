
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_loading_indecator.dart';
import 'package:store/features/account/presentation/profile/manager/change_password_cubit/change_password_cubit.dart';
import 'package:store/features/account/presentation/profile/manager/change_password_cubit/change_password_state.dart';

class ChangePasswordButtonSection extends StatelessWidget {
  const ChangePasswordButtonSection({
    super.key,
    required this.formKey,
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.oldPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController oldPasswordController;

  @override
  Widget build(BuildContext context) {
    final changePasswordCubit = BlocProvider.of<ChangePasswordCubit>(context);

    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      bloc: changePasswordCubit,
      listenWhen:
          (previous, current) =>
              current is ChangePasswordFailesState ||
              current is ChangePasswordSuccessState,
      listener: (context, state) {
        if (state is ChangePasswordSuccessState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Successfuly")));
        } else if (state is ChangePasswordFailesState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed-old password was wrong")),
          );
        }
      },
      buildWhen:
          (previous, current) =>
              current is ChangePasswordInitial ||
              current is ChangePasswordFailesState ||
              current is ChangePasswordLoadingState ||
              current is ChangePasswordSuccessState,
      builder: (context, state) {
        if (state is ChangePasswordLoadingState) {
          return CustomLoadingIndecator();
        } else if (state is ChangePasswordSuccessState ||
            state is ChangePasswordInitial ||
            state is ChangePasswordFailesState) {
          return CustomButon(
            text: "Confirm",
            onPressed: () {
              if (formKey.currentState!.validate() &&
                  newPasswordController.text ==
                      confirmPasswordController.text) {
                changePasswordCubit.changePassword(
                  oldPasswordController.text,
                  newPasswordController.text,
                );
              } else if (newPasswordController.text !=
                  confirmPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Confirm Password must be the same as the New Password",
                    ),
                  ),
                );
              }
            },
          );
        } else {
          return Text("error");
        }
      },
    );
  }
}
