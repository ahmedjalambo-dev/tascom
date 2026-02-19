import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/helpers/validator.dart';
import 'package:tascom/core/storage/session_manager.dart';
import 'package:tascom/core/storage/shared_pref_helper.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/bottom_sheets/my_list_picker_bottom_sheet.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_label.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/core/widgets/my_text_field.dart';
import 'package:tascom/features/settings/edit_profile/ui/widgets/skills_input_widget.dart';
import 'package:tascom/features/settings/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:tascom/features/settings/edit_profile/cubit/edit_profile_state.dart';
import 'package:tascom/features/settings/edit_profile/data/models/update_user_request.dart';
import 'package:tascom/features/user/data/models/user_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _aboutController = TextEditingController();
  final _emailController = TextEditingController();

  String? _selectedGender;
  DateTime? _selectedDOB;
  List<String> _selectedSkills = [];
  File? _selectedImage;
  String? _currentAvatarUrl;
  UserModel? _loadedUser;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _aboutController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _prefillFields(UserModel user) {
    _loadedUser = user;
    _nameController.text = user.name;
    _emailController.text = user.email;
    _phoneController.text = user.phoneNumber ?? '';
    _aboutController.text = user.about ?? '';
    _selectedGender = user.gender;
    _selectedDOB = user.dateOfBirth;
    _currentAvatarUrl = user.avatar;

    if (user.skills != null && user.skills!.isNotEmpty) {
      try {
        final decoded = jsonDecode(user.skills!);
        if (decoded is List) {
          _selectedSkills = decoded.cast<String>();
        }
      } catch (_) {
        _selectedSkills = [user.skills!];
      }
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _selectedImage = File(image.path));
    }
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDOB ?? DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: MyColors.brand.purple,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: MyColors.text.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (date != null) {
      setState(() => _selectedDOB = date);
    }
  }

  Future<void> _selectGender() async {
    final result = await showMyListPickerBottomSheet<String>(
      context: context,
      title: 'Select Gender',
      items: const ['Male', 'Female'],
      labelBuilder: (item) => item,
      selectedItem: _selectedGender,
    );
    if (result != null) {
      setState(() => _selectedGender = result);
    }
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    final userId = SessionManager.instance.currentUserId;
    if (userId == null) return;

    final request = UpdateUserRequest(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phoneNumber: _phoneController.text.trim().isNotEmpty
          ? _phoneController.text.trim()
          : null,
      about: _aboutController.text.trim().isNotEmpty
          ? _aboutController.text.trim()
          : null,
      gender: _selectedGender,
      dateOfBirth: _selectedDOB,
      skills: _selectedSkills.isNotEmpty ? _selectedSkills : null,
      avatarFile: _selectedImage,
    );

    context.read<EditProfileCubit>().updateUser(userId, request);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (user) {
            _prefillFields(user);
          },
          updateSuccess: (user) async {
            _isSubmitting = false;
            await SharedPrefHelper.setUserName(user.name);
            await SharedPrefHelper.setUserEmail(user.email);
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Profile updated successfully'),
                  backgroundColor: MyColors.states.success,
                ),
              );
              context.pop();
            }
          },
          error: (error) {
            _isSubmitting = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.message ?? 'Failed to update profile'),
                backgroundColor: MyColors.states.error,
              ),
            );
          },
          loading: () {
            _isSubmitting = true;
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.background.primary,
          body: state.maybeWhen(
            loading: () => _loadedUser != null
                ? _buildBody()
                : const Center(child: CircularProgressIndicator()),
            loaded: (_) => _buildBody(),
            updateSuccess: (_) => _buildBody(),
            error: (_) => _loadedUser != null
                ? _buildBody()
                : Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Failed to load profile',
                          style: MyTextStyles.body.body1.copyWith(
                            color: MyColors.text.secondary,
                          ),
                        ),
                        const VerticalSpace(16),
                        MyButton(
                          text: 'Retry',
                          onPressed: () {
                            final userId =
                                SessionManager.instance.currentUserId;
                            if (userId != null) {
                              context.read<EditProfileCubit>().getUser(userId);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
            orElse: () => const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(24),
                  _buildAvatarSection(),
                  const VerticalSpace(24),
                  const MyLabel('Name'),
                  const VerticalSpace(8),
                  MyTextField(
                    controller: _nameController,
                    hintText: 'Enter your name',
                    validator: (value) => Validator.validateName(value, 'Name'),
                  ),
                  const VerticalSpace(20),
                  const MyLabel('Phone Number'),
                  const VerticalSpace(8),
                  MyTextField(
                    controller: _phoneController,
                    hintText: '059-000-0000',
                    textInputType: TextInputType.phone,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: TextButton(
                        onPressed: () {
                          // Focus the phone field for editing
                        },
                        child: Text(
                          'Change',
                          style: MyTextStyles.button.secondaryButton2.copyWith(
                            color: MyColors.brand.purple,
                          ),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return validatePhone(value);
                      }
                      return null;
                    },
                  ),
                  const VerticalSpace(20),
                  const MyLabel('About me'),
                  const VerticalSpace(8),
                  MyTextField(
                    controller: _aboutController,
                    hintText:
                        'Tell us a bit about yourself (e.g., interests, what you\'re looking for, or what you offer).',
                    maxLines: 4,
                  ),
                  const VerticalSpace(20),
                  const MyLabel('Skills'),
                  const VerticalSpace(8),
                  SkillsInputWidget(
                    selectedSkills: _selectedSkills,
                    onSkillAdded: (skill) {
                      setState(() => _selectedSkills.add(skill));
                    },
                    onSkillRemoved: (skill) {
                      setState(() => _selectedSkills.remove(skill));
                    },
                  ),
                  const VerticalSpace(20),
                  const MyLabel('Email'),
                  const VerticalSpace(8),
                  MyTextField(
                    controller: _emailController,
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                    validator: (value) =>
                        Validator.validateEmail(value, 'Email'),
                  ),
                  const VerticalSpace(20),
                  const MyLabel('Gender'),
                  const VerticalSpace(8),
                  _buildGenderSelector(),
                  const VerticalSpace(20),
                  const MyLabel('Date of birth'),
                  const VerticalSpace(8),
                  _buildDateSelector(),
                  const VerticalSpace(32),
                  MyButton(
                    text: _isSubmitting ? 'Updating...' : 'Confirm',
                    onPressed: _isSubmitting ? null : _submitForm,
                  ),
                  const VerticalSpace(32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return MyAppBar(
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: SvgPicture.asset(
            MyIcons.arrowBack,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              MyColors.text.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      title: Center(
        child: Text(
          'Edit Profile',
          style: MyTextStyles.heading.h22.copyWith(
            color: MyColors.text.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 56.r,
            backgroundColor: MyColors.background.secondary,
            backgroundImage: _selectedImage != null
                ? FileImage(_selectedImage!)
                : (_currentAvatarUrl != null && _currentAvatarUrl!.isNotEmpty
                          ? NetworkImage(_currentAvatarUrl!)
                          : null)
                      as ImageProvider?,
            child:
                (_selectedImage == null &&
                    (_currentAvatarUrl == null || _currentAvatarUrl!.isEmpty))
                ? Icon(Icons.person, size: 56.w, color: MyColors.text.third)
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: _pickImage,
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: MyColors.brand.purple,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: MyColors.background.primary,
                    width: 2,
                  ),
                ),
                child: Icon(Icons.edit, size: 16.w, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderSelector() {
    return GestureDetector(
      onTap: _selectGender,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.border.border, width: 1.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _selectedGender ?? 'Select Gender',
                style: MyTextStyles.body.body2.copyWith(
                  color: _selectedGender != null
                      ? MyColors.text.primary
                      : MyColors.text.third,
                ),
              ),
            ),
            SvgPicture.asset(
              MyIcons.arrowDown,
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                MyColors.text.third,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return GestureDetector(
      onTap: _selectDate,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.border.border, width: 1.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          _selectedDOB != null
              ? DateFormat('dd/MM/yyyy').format(_selectedDOB!)
              : 'dd/mm/yyyy',
          style: MyTextStyles.body.body2.copyWith(
            color: _selectedDOB != null
                ? MyColors.text.primary
                : MyColors.text.third,
          ),
        ),
      ),
    );
  }
}
