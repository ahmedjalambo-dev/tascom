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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;

  @override
  void initState() {
    super.initState();
    _nameFocus.addListener(() => setState(() {}));
    _emailFocus.addListener(() => setState(() {}));
    _phoneFocus.addListener(() => setState(() {}));
    _passwordFocus.addListener(() => setState(() {}));
    _confirmPasswordFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
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
                const VerticalSpace(24),

                // Logo
                Center(child: Image.asset(MyImages.tascom, height: 120.h)),
                VerticalSpace(16.h),

                // Title
                Center(
                  child: Text(
                    'Create an account',
                    style: MyTextStyles.heading.h22.copyWith(
                      color: MyColors.text.primary,
                    ),
                  ),
                ),
                VerticalSpace(24.h),

                // Name
                const MyLabel('Name'),
                const VerticalSpace(8),
                MyTextField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  hintText: 'Placeholder',
                  textInputType: TextInputType.name,
                  prefixIcon: _buildPrefixIcon(
                    MyIcons.userStroke,
                    _nameFocus,
                  ),
                ),
                VerticalSpace(16.h),

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

                // Phone Number
                const MyLabel('Phone Number'),
                const VerticalSpace(8),
                MyTextField(
                  controller: _phoneController,
                  focusNode: _phoneFocus,
                  hintText: '059-000-0000',
                  textInputType: TextInputType.phone,
                  prefixIcon: _buildPrefixIcon(MyIcons.phone, _phoneFocus),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(12.dg),
                    child: SvgPicture.asset(
                      MyIcons.flag,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
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
                VerticalSpace(16.h),

                // Confirm Password
                const MyLabel('Confirm Password'),
                const VerticalSpace(8),
                MyTextField(
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocus,
                  hintText: '12345678',
                  textInputType: TextInputType.visiblePassword,
                  obscureText: _obscureConfirmPassword,
                  prefixIcon: _buildPrefixIcon(
                    MyIcons.lockPassword,
                    _confirmPasswordFocus,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () => setState(
                      () =>
                          _obscureConfirmPassword = !_obscureConfirmPassword,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.dg),
                      child: SvgPicture.asset(
                        _obscureConfirmPassword
                            ? MyIcons.eyeOff
                            : MyIcons.eye,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(8),

                // Terms & Privacy Policy
                Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Checkbox(
                        value: _agreeToTerms,
                        onChanged: (value) =>
                            setState(() => _agreeToTerms = value ?? false),
                        activeColor: MyColors.brand.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.dg),
                        ),
                        side: BorderSide(color: MyColors.border.border),
                      ),
                    ),
                    const HorizontalSpace(8),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: MyTextStyles.body.body2.copyWith(
                            color: MyColors.text.primary,
                          ),
                          children: [
                            const TextSpan(text: 'I agree to the '),
                            TextSpan(
                              text: 'Terms & Privacy Policy',
                              style: MyTextStyles.button.secondaryButton2
                                  .copyWith(
                                    color: MyColors.text.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: MyColors.text.primary,
                                  ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(24),

                // Sign Up Button
                MyButton(
                  text: 'Sign up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle sign up
                    }
                  },
                ),
                const VerticalSpace(20),

                const VerticalSpace(20),

                // Already Have An Account? Login
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: MyTextStyles.body.body2.copyWith(
                        color: MyColors.text.primary,
                      ),
                      children: [
                        const TextSpan(text: 'Already Have An Account? '),
                        TextSpan(
                          text: 'Login',
                          style: MyTextStyles.button.primaryButton1.copyWith(
                            color: MyColors.brand.purple,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushReplacementNamed(MyRoutes.login);
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
