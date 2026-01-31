import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/settings/security/app_password_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleChangePassword() {
    if (_formKey.currentState!.validate()) {
      // 1. إغلاق الكيبورد
      FocusScope.of(context).unfocus();

      // 2. إظهار رسالة نجاح
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Password changed successfully!'),
          backgroundColor: MyColors.brand.purple,
          behavior: SnackBarBehavior.floating,
        ),
      );

      // 3. مسح الحقول أو العودة للخلف بعد فترة قصيرة
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.secondary,
      appBar: AppBar(
        backgroundColor: MyColors.background.secondary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: MyColors.text.primary,
            size: 20.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Password',
          style: MyTextStyle.heading.h22.copyWith(
            color: MyColors.text.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPasswordField(
                controller: _oldPasswordController,
                title: 'Old Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your old password';
                  }
                  return null;
                },
              ),
              AppPasswordField(
                controller: _newPasswordController,
                title: 'New Password',
                helperText: 'Minimum 8 characters',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              AppPasswordField(
                controller: _confirmPasswordController,
                title: 'Confirm New Password',
                helperText: 'Minimum 8 characters',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your new password';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          bottom: 20.h,
          top: 10.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.brand.purple,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                onPressed: _handleChangePassword,
                child: Text(
                  "Change password",
                  style: MyTextStyle.button.primaryButton1.copyWith(
                    color: MyColors.text.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tascom/core/themes/my_colors.dart';
// import 'package:tascom/core/themes/my_text_style.dart';

// import 'package:tascom/features/settings/security/app_password_field.dart';

// class ChangePasswordScreen extends StatefulWidget {
//   const ChangePasswordScreen({super.key});

//   @override
//   State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _oldPasswordController = TextEditingController();
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   @override
//   void dispose() {
//     _oldPasswordController.dispose();
//     _newPasswordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.background.secondary,
//       appBar: AppBar(
//         backgroundColor: MyColors.background.secondary,
//         elevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios_new,
//             color: MyColors.text.primary,
//             size: 20.sp,
//           ),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           'Password',
//           style: MyTextStyle.heading.h22.copyWith(
//             color: MyColors.text.primary,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppPasswordField(
//                 controller: _oldPasswordController,
//                 title: 'Old Password',
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your old password';
//                   }
//                   return null;
//                 },
//               ),
//               AppPasswordField(
//                 controller: _newPasswordController,
//                 title: 'New Password',
//                 helperText: 'Minimum 8 characters',
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a new password';
//                   }
//                   if (value.length < 8) {
//                     return 'Password must be at least 8 characters';
//                   }
//                   return null;
//                 },
//               ),
//               AppPasswordField(
//                 controller: _confirmPasswordController,
//                 title: 'Confirm New Password',
//                 helperText: 'Minimum 8 character',
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please confirm your new password';
//                   }
//                   if (value != _newPasswordController.text) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.only(
//           left: 24.w,
//           right: 24.w,
//           bottom: 20.h,
//           top: 10.h,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
           
//             SizedBox(
//   width: double.infinity, // لجعل الزر يأخذ عرض الشاشة بالكامل
//   height: 56.h,           // ارتفاع الزر
//   child: ElevatedButton(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: MyColors.brand.purple, // لون الزر من ملف الألوان الخاص بكِ
//       elevation: 0,                           // لإلغاء الظل
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(30.r), // زوايا منحنية (ريديس)
//       ),
//     ),
//     onPressed: () {
//        if (_formKey.currentState!.validate()) {
//     // الفورم صحيح ✅
//     print("Password changed successfully!");
    
//     // لمسح الحقول 
//     _oldPasswordController.clear();
//     _newPasswordController.clear();
//     _confirmPasswordController.clear();
//   } else {
//     print("Please fix the errors in the form");
//   }
     
//     },
//     child: Text(
//       "Change password", // النص الذي يظهر على الزر
//       style: MyTextStyle.button.primaryButton1.copyWith(
//         color: MyColors.text.white,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ),
// )
         
//           ],
//         ),
//       ),
//     );
//   }
// }
