import 'package:flutter/material.dart';
import 'package:tascom/core/helpers/validator.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart' show MyTextStyle;
import 'package:tascom/features/onboarding/ui/widgets/buttom.dart';
import 'package:tascom/features/onboarding/ui/widgets/input_form.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

final _formKey = GlobalKey<FormState>();
final nameController = TextEditingController();
final emailController = TextEditingController();
final phoneController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();

class _LogInState extends State<LogIn> {
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
              Image.asset('assets/images/signuplogo.png', fit: BoxFit.contain),
              const SizedBox(height: 20),
              Text(
                'Welcome Back!',
                style: MyTextStyle.heading.h21.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
              const SizedBox(height: 20),

              MyInput(
                label: 'Email',
                controller: emailController,
                hintText: 'example@gmail.com',
                validator: (value) => Validator.validateEmail(value, 'Email'),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/icons/signUp/letter.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),

              MyInput(
                label: 'Password',
                controller: passwordController,
                hintText: '********',
                validator: (value) =>
                    Validator.validatePassword(value, 'Password'),
                obscureText: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/icons/signUp/lock.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                passwordIcon: true,
              ),

              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  print('Terms & Privacy clicked');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: MyTextStyle.button.secondaryButton2.copyWith(
                        color: MyColors.brand.purple,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              MyBottom(
                text: 'Login',
                color: MyColors.brand.purple,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print('Form is valid');
                  } else {
                    print('Form has errors');
                  }
                },
              ),
              const SizedBox(height: 20),

              Text(
                'Or continue with',
                style: MyTextStyle.body.body2.copyWith(
                  color: MyColors.text.secondary,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset('assets/icons/signUp/google.png'),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {},
                    child: Image.asset('assets/icons/signUp/facebook.png'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont Have An Account?',
                    style: MyTextStyle.body.body2.copyWith(
                      color: MyColors.text.secondary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                    child: Text(
                      'Sign Up',
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
