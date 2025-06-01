import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; 
import 'package:store/core/widgets/custom_buton.dart';
import 'package:store/core/widgets/custom_textformfield_widget.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 30),
      child: Column(
        children: [
          CustomTextFormFieldWidget(hintText: "Ahmed Gamal"),
          const SizedBox(height: 30),
          CustomTextFormFieldWidget(hintText: "ahmedgfouad2020@gmail.com"),
          Spacer(),
          CustomButon(text: "Update Profile", onPressed: () {}),
        ],
      ),
    );
  }
}
