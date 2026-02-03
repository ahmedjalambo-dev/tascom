import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/constants/my_images.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_label.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/core/widgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _emailFocus.addListener(() => setState(() {}));
    _passwordFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpace(48),

                // Logo
                Center(child: Image.asset(MyImages.tascom, height: 120.h)),
                VerticalSpace(16.h),

                // Title
                Center(
                  child: Text(
                    'Welcome Back!',
                    style: MyTextStyles.heading.h22.copyWith(
                      color: MyColors.text.primary,
                    ),
                  ),
                ),
                VerticalSpace(32.h),

                // Email
                const MyLabel('Email'),
                const VerticalSpace(8),
                MyTextField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  hintText: 'Placeholder@gmail.com',
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: _buildPrefixIcon(MyIcons.mail, _emailFocus),
                ),
                VerticalSpace(16.h),

                // Password
                const MyLabel('Password'),
                const VerticalSpace(8),
                MyTextField(
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  hintText: '********',
                  textInputType: TextInputType.visiblePassword,
                  obscureText: _obscurePassword,
                  prefixIcon: _buildPrefixIcon(
                    MyIcons.lockPassword,
                    _passwordFocus,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                    child: Padding(
                      padding: EdgeInsets.all(12.dg),
                      child: SvgPicture.asset(
                        _obscurePassword ? MyIcons.eyeOff : MyIcons.eye,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(8),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(MyRoutes.forgotPassword);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: MyTextStyles.button.secondaryButton2.copyWith(
                        color: MyColors.brand.purple,
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(24),

                // Login Button
                MyButton(
                  text: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.pushReplacementNamed(MyRoutes.root);
                    }
                  },
                ),
                const VerticalSpace(24),

                // Don't Have An Account? Sign Up
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: MyTextStyles.body.body2.copyWith(
                        color: MyColors.text.primary,
                      ),
                      children: [
                        const TextSpan(text: 'Dont Have An Account? '),
                        TextSpan(
                          text: 'Sign Up',
                          style: MyTextStyles.button.primaryButton1.copyWith(
                            color: MyColors.brand.purple,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushReplacementNamed(MyRoutes.signUp);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalSpace(24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrefixIcon(String assetPath, FocusNode focusNode) {
    final color = focusNode.hasFocus
        ? MyColors.brand.purple
        : MyColors.border.border;
    return Padding(
      padding: EdgeInsets.all(12.dg),
      child: SvgPicture.asset(
        assetPath,
        width: 24.w,
        height: 24.h,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
