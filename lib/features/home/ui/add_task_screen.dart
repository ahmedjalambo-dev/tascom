import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/bottom_sheets/my_list_picker_bottom_sheet.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';
import 'package:tascom/core/widgets/my_button.dart';
import 'package:tascom/core/widgets/my_text_field.dart';
import 'package:tascom/core/widgets/my_image_picker.dart';
import 'package:tascom/core/widgets/my_info_box.dart';
import 'package:tascom/core/widgets/my_label.dart';
import 'package:tascom/core/widgets/my_selector.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/core/widgets/my_user_profile_row.dart';
import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  TaskCategory? _selectedCategory;
  TaskPriority? _selectedPriority;
  String? _selectedLocation;
  DateTime? _selectedDeadline;
  File? _selectedImage;

  final List<String> _locations = [
    'Palestine, Gaza city',
    'Palestine, Rafah',
    'Palestine, Khan Yunis',
    'Palestine, Deir al-Balah',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
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
      initialDate: _selectedDeadline ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
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
      setState(() => _selectedDeadline = date);
    }
  }

  Future<void> _showLocationPicker() async {
    final result = await showMyListPickerBottomSheet<String>(
      context: context,
      title: 'Select Location',
      items: _locations,
      labelBuilder: (item) => item,
      selectedItem: _selectedLocation,
    );
    if (result != null) {
      setState(() => _selectedLocation = result);
    }
  }

  Future<void> _showCategoryPicker() async {
    final result = await showMyListPickerBottomSheet<TaskCategory>(
      context: context,
      title: 'Select Category',
      items: TaskCategory.values,
      labelBuilder: (category) => category.displayName,
      selectedItem: _selectedCategory,
      leadingBuilder: (category) => SvgPicture.asset(
        category.icon,
        width: 24.w,
        height: 24.h,
        colorFilter: ColorFilter.mode(
          _selectedCategory == category
              ? MyColors.brand.purple
              : MyColors.text.secondary,
          BlendMode.srcIn,
        ),
      ),
    );
    if (result != null) {
      setState(() => _selectedCategory = result);
    }
  }

  Future<void> _showPriorityPicker() async {
    final result = await showMyListPickerBottomSheet<TaskPriority>(
      context: context,
      title: 'Select Priority',
      items: TaskPriority.values,
      labelBuilder: (priority) => priority.displayName,
      selectedItem: _selectedPriority,
      leadingBuilder: (priority) => SvgPicture.asset(
        priority.icon,
        width: 24.w,
        height: 24.h,
      ),
      selectedColorBuilder: (priority) => priority.textColor,
    );
    if (result != null) {
      setState(() => _selectedPriority = result);
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedCategory == null) {
        _showSnackBar('Please select a category');
        return;
      }
      if (_selectedPriority == null) {
        _showSnackBar('Please select a priority');
        return;
      }
      if (_selectedLocation == null) {
        _showSnackBar('Please select a location');
        return;
      }
      if (_selectedDeadline == null) {
        _showSnackBar('Please select a deadline');
        return;
      }

      // TODO: Submit the task data to backend
      Navigator.pop(context);
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: MyColors.states.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset(
                  MyIcons.cancelStroke,
                  width: 24.w,
                  height: 24.h,
                  colorFilter: ColorFilter.mode(
                    MyColors.text.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              title: Text(
                'New Post',
                style: MyTextStyles.heading.h22.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpace(16),
                    const MyUserProfileRow(
                      name: 'Ahmed Khaled',
                      subtitle: 'Palestine, Gaza city',
                      avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
                    ),
                    const VerticalSpace(24),

                    const MyLabel('Task Title'),
                    const VerticalSpace(8),
                    MyTextField(
                      controller: _titleController,
                      hintText: 'e.g. I need help in ...',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title is required';
                        }
                        if (value.length < 5) {
                          return 'Title must be at least 5 characters';
                        }
                        return null;
                      },
                    ),
                    const VerticalSpace(20),

                    const MyLabel('Description'),
                    const VerticalSpace(8),
                    MyTextField(
                      controller: _descriptionController,
                      hintText: 'Describe your task and find helpers!',
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Description is required';
                        }
                        if (value.length < 10) {
                          return 'Description must be at least 10 characters';
                        }
                        return null;
                      },
                    ),
                    const VerticalSpace(16),

                    MyImagePicker(
                      selectedImage: _selectedImage,
                      onPickImage: _pickImage,
                      onRemoveImage: () => setState(() => _selectedImage = null),
                    ),
                    const VerticalSpace(24),

                    const MyLabel('Location'),
                    const VerticalSpace(8),
                    MySelector(
                      icon: MyIcons.locationStroke,
                      label: _selectedLocation ?? 'Select Location',
                      isPlaceholder: _selectedLocation == null,
                      onTap: _showLocationPicker,
                    ),
                    const VerticalSpace(20),

                    const MyLabel('Category'),
                    const VerticalSpace(8),
                    MySelector(
                      icon: _selectedCategory?.icon ?? MyIcons.dashboardStroke,
                      label: _selectedCategory?.displayName ?? 'Select Category',
                      isPlaceholder: _selectedCategory == null,
                      onTap: _showCategoryPicker,
                    ),
                    const VerticalSpace(20),

                    const MyLabel('Priority'),
                    const VerticalSpace(8),
                    MySelector(
                      icon: _selectedPriority?.icon ?? MyIcons.priorityStroke,
                      label: _selectedPriority?.displayName ?? 'Select Priority',
                      isPlaceholder: _selectedPriority == null,
                      onTap: _showPriorityPicker,
                    ),
                    const VerticalSpace(20),

                    const MyLabel('Deadline'),
                    const VerticalSpace(8),
                    MySelector(
                      icon: MyIcons.calenderStroke,
                      label: _selectedDeadline != null
                          ? DateFormat('dd/MM/yyyy').format(_selectedDeadline!)
                          : '00/00/0000',
                      isPlaceholder: _selectedDeadline == null,
                      onTap: _selectDate,
                      showDropdownIcon: false,
                    ),
                    const VerticalSpace(24),

                    const MyInfoBox(
                      title: 'Important Instructions Before Posting',
                      items: [
                        MyInfoBoxItem(
                          prefix: 'Points: ',
                          highlighted: '5 points',
                          suffix: ' will be deducted once the task is completed, based on the task details',
                        ),
                        MyInfoBoxItem(
                          prefix: 'Accurate Information: ',
                          suffix: 'Make sure all details (category, priority, and location) are correct to avoid confusion and attract the right helper',
                        ),
                      ],
                    ),
                    const VerticalSpace(24),

                    MyButton(text: 'Post', onPressed: _submitForm),
                    const VerticalSpace(32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
