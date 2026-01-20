import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/features/profile/ui/widgets/custom_text_form_faild.dart';
import 'package:tascom/features/profile/ui/widgets/date_of_birth_faild.dart';
import 'package:tascom/features/profile/ui/widgets/gender_dropdown.dart';
import 'package:tascom/features/profile/ui/widgets/skills_field.dart';
import 'package:tascom/features/profile/ui/widgets/profile_image_picker.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController PhoneNumberController = TextEditingController();

  final TextEditingController aboutMeController = TextEditingController();

  final TextEditingController skillsController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  String? selectedGender;
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.secondary,
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: MyTextStyle.heading.h22.copyWith(fontWeight: FontWeight.w600),
        ),
        backgroundColor: MyColors.background.primary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: MyColors.text.primary, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          children: [
            const ProfileImagePicker(),
            const SizedBox(height: 32),
            CustomTextFormField(
              controller: userNameController,
              hintText: "Adam Ahmed",
              title: "Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Name is required";
                }
                return null;
              },
            ),
            CustomTextFormField(
              controller: PhoneNumberController,
              hintText: "059-000-0000",
              title: "Phone Number",
              suffix: TextButton(
                onPressed: () {
                  // TODO: Implement change phone number logic
                },
                child: Text(
                  "Change",
                  style: MyTextStyle.button.secondaryButton2.copyWith(
                    color: MyColors.brand.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            CustomTextFormField(
              controller: aboutMeController,
              hintText:
                  "Tell us a bit about yourself (e.g., interests, what you’re looking for, or what you offer).",
              title: "About me",
              maxLines: 4,
            ),
            const SkillsField(),
            CustomTextFormField(
              controller: emailController,
              hintText: "AdamAhmed@gmail.com",
              title: "Email",
            ),
            GenderDropdown(
              value: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            CustomDatePicker(),
            const SizedBox(height: 100), // Add some spacing at the bottom so content isn't hidden by the fixed button if it overlaps, although bottomNavBar pushes content up usually.
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h, top: 10.h),
        decoration: BoxDecoration(
          color: MyColors.background.secondary,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.brand.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? true) {
                    print("Confirm Pressed");
                  }
                },
                child: Text(
                  "Confirm",
                  style: MyTextStyle.button.primaryButton1.copyWith(
                    color: MyColors.text.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 134.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: MyColors.text.primary,
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}