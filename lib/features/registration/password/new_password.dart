import 'package:flutter/material.dart';
import 'package:tascom/core/helpers/validator.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/my_buttom.dart';
import 'package:tascom/core/widgets/my_input.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

final _formKey = GlobalKey<FormState>();
final NewpasswordController = TextEditingController();
final confirmNewPasswordController = TextEditingController();

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/icons/registration/logo.png',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                'Create New Password',
                style: MyTextStyle.heading.h21.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
              Text(
                'Create a new password to secure you account',
                style: MyTextStyle.body.body2.copyWith(
                  color: MyColors.text.secondary,
                ),
              ),
              const SizedBox(height: 20),

              MyInput(
                label: 'Create New Password',
                controller: NewpasswordController,
                hintText: '********',
                validator: (value) => Validator.validatePassword(value),
                obscureText: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/icons/registration/lock.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                passwordIcon: true,
              ),
              MyInput(
                label: 'Confirm New Password',
                controller: confirmNewPasswordController,
                hintText: '********',
                validator: (value) => Validator.validatePassword(value),
                obscureText: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/icons/registration/lock.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                passwordIcon: true,
              ),

              const SizedBox(height: 20),
              MyBottom(
                text: 'Send Reset Link',
                color: MyColors.brand.purple,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/log_in');
                  } else {
                    print('Form has errors');
                  }
                },
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Back to ',
                    style: MyTextStyle.body.body2.copyWith(
                      color: MyColors.text.secondary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/log_in');
                    },
                    child: Text(
                      'Log In',
                      style: MyTextStyle.button.primaryButton1.copyWith(
                        color: MyColors.brand.purple,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
