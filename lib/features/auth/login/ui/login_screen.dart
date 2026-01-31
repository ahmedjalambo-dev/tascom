import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/helpers/validator.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/auth/widgets/auth_footer.dart';
import 'package:tascom/features/auth/widgets/auth_header.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_text_form_field.dart';
import 'package:tascom/features/auth/widgets/social_login_section.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AuthHeader(title: 'Welcome Back!'),
                // Email
                MyTextFormField(
                  lable: 'Email',
                  controller: emailController,
                  hintText: 'Placeholder@gmail.com',
                  validator: (value) => Validator.validateEmail(value, 'Email'),
                  prefixSvgPath: 'assets/icons/auth/email.svg',
                  textInputType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                VerticalSpace(16.h),

                // Password
                MyTextFormField(
                  lable: 'Password',
                  controller: passwordController,
                  hintText: '********',
                  validator: (value) =>
                      Validator.validatePassword(value, 'Password'),
                  obscureText: !_isPasswordVisible,
                  prefixSvgPath: 'assets/icons/auth/lock-password.svg',
                  textInputType: TextInputType.text,
                  suffixIcon: GestureDetector(
                    onTap: () => setState(
                      () => _isPasswordVisible = !_isPasswordVisible,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        _isPasswordVisible
                            ? 'assets/icons/auth/eye_on.svg'
                            : 'assets/icons/auth/eye_off.svg',
                        width: 24.w,
                        height: 24.h,
                        colorFilter: ColorFilter.mode(
                          MyColors.text.third,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                VerticalSpace(8.h),

                // Forgot Password
                GestureDetector(
                  onTap: () => context.pushNamed(MyRoutes.forgotPassword),
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

                VerticalSpace(40.h),

                // login
                MyButton(
                  text: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Implement login logic
                    }
                  },
                ),

                VerticalSpace(40.h),
                SocialLoginSection(
                  onGoogleTap: () {
                    // TODO: Implement Google login
                  },
                  onFacebookTap: () {
                    // TODO: Implement Facebook login
                  },
                ),
                VerticalSpace(24.h),
                AuthFooter(
                  questionText: 'Don\'t have an account?',
                  actionText: 'Sign Up',
                  onActionTap: () =>
                      context.pushReplacementNamed(MyRoutes.signUp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
