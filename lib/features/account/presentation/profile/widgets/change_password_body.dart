import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/app_router.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/features/account/presentation/profile/widgets/change_password_textform_field_widget.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 80, bottom: 30),
      child: Column(
        children: [
          ChangePasswordTextformFieldWidget(hintName: "Old Password"),
          SizedBox(height: 25),
          ChangePasswordTextformFieldWidget(hintName: "New Password"),
          SizedBox(height: 25),
          ChangePasswordTextformFieldWidget(hintName: "Confirm Password"),
          Spacer(),
          CustomButon(text: "Confirm", onPressed: () {}),
          SizedBox(height: 15),
          CustomButon(
            text: "Back To Sign In",
            onPressed: () {
              // بترجعني للصفحه و بتمسح كل الصفحات اللي مفتوحه من الاستاك 
              context.go(AppRouter.kLogInView);
            },
            bacgrouncColor: AppColors().white,
            textColor: AppColors().orange,
          ),
        ],
      ),
    );
  }
}
