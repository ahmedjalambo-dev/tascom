import 'package:flutter/material.dart';
import 'package:tascom/core/helpers/validator.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/my_buttom.dart';
import 'package:tascom/core/widgets/my_input.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

final _formKey = GlobalKey<FormState>();
final emailController = TextEditingController();
final confirmPasswordController = TextEditingController();

class _ForgetPasswordState extends State<ForgetPassword> {
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
                'Forgot Password',
                style: MyTextStyle.heading.h21.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
              Text(
                'Enter your email to receive reset instructions',
                style: MyTextStyle.body.body2.copyWith(
                  color: MyColors.text.secondary,
                ),
              ),
              const SizedBox(height: 20),

              MyInput(
                label: 'Email',
                controller: emailController,
                hintText: 'example@gmail.com',
                validator: (value) => Validator.validateEmail(value),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/icons/registration/letter.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              MyBottom(
                text: 'Send Reset Link',
                color: MyColors.brand.purple,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/new_password');
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
