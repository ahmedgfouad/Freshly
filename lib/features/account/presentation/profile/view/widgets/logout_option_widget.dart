import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';
import 'package:store/features/account/presentation/profile/view/widgets/custom_logout_shimmer.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_cubit.dart';
import 'package:store/features/registeration/presentation/manager/auth/auth_state.dart';
import 'package:store/generated/l10n.dart';

class LogoutOptionWidget extends StatelessWidget {
  const LogoutOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocBuilder<AuthCubit, AuthState>(
      bloc: authCubit,
      buildWhen:
          (previous, current) =>
              current is LoginSuccessState ||
              current is SignupSuccessState ||
              current is AuthInitial,
      builder: (context, state) {
        if (state is LoginSuccessState || state is SignupSuccessState) {
          return InkWell(
            splashColor: context.appColors.orange,
            onTap: () async {
              await authCubit.logout();
            },
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.logout, color: context.appColors.browen, size: 30),
                  SizedBox(width: 15),
                  Text(
                    S.of(context).Logout,
                    style: AppStyles.textStyle18(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        } else if (state is AuthInitial) {
          return   LogoutShimmer(
          );
        } else {
          return const Text("error");
        }
      },
    );
  }
}
