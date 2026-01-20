import 'package:flutter/material.dart';
import 'package:tascom/core/helpers/validator.dart'
    show Validator, validatePhone;
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/onboarding/ui/widgets/buttom.dart';
import 'package:tascom/features/onboarding/ui/widgets/input_form.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final _formKey = GlobalKey<FormState>();
final nameController = TextEditingController();
final emailController = TextEditingController();
final phoneController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();

bool _isChecked = false;

class _SignUpState extends State<SignUp> {
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
                'Create an account',
                style: MyTextStyle.heading.h21.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
              const SizedBox(height: 20),

              MyInput(
                label: 'Name',
                controller: nameController,
                hintText: 'Your Name',
                validator: (value) => Validator.validateName(value, 'Name'),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/icons/signUp/person.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),

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
                label: 'Phone Number',
                controller: phoneController,
                hintText: '059-000-0000',
                validator: (value) => validatePhone(value),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/icons/signUp/phone.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/icons/signUp/flag.png',
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

              MyInput(
                label: 'Confirm Password',
                controller: confirmPasswordController,
                hintText: '********',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm password cannot be empty';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
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

              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                    activeColor: MyColors.brand.purple,
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      print('Terms & Privacy clicked');
                    },
                    child: Row(
                      children: [
                        Text(
                          'I agree ',
                          style: MyTextStyle.button.secondaryButton2.copyWith(
                            color: MyColors.text.primary,
                          ),
                        ),
                        Text(
                          'Terms & Privacy Policy',
                          style: MyTextStyle.button.secondaryButton2.copyWith(
                            color: MyColors.text.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MyBottom(
                text: 'Sign Up',
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
                    'Already have an account?',
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
