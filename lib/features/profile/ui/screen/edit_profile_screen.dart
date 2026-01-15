import 'package:flutter/material.dart';
import 'package:tascom/features/profile/widgets/custom_text_form_faild.dart';
import 'package:tascom/features/profile/widgets/date_of_birth_faild.dart';
import 'package:tascom/features/profile/widgets/gender_dropdown.dart';
import 'package:tascom/features/profile/widgets/skills_field.dart';
import 'package:tascom/features/profile/widgets/profile_image_picker.dart';

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
      backgroundColor:Color(0xffFFFFFF),
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
        ),
        backgroundColor:Color(0xffF9FAFB),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
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
                child: const Text(
                  "Change",
                  style: TextStyle(
                    color: Color(0xFF6C38F7), // Purple color
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
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20, top: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C38F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? true) {
                    print("Confirm Pressed");
                  }
                },
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 134,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}