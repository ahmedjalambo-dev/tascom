import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

Future<T?> showMyListPickerBottomSheet<T>({
  required BuildContext context,
  required String title,
  required List<T> items,
  required String Function(T) labelBuilder,
  T? selectedItem,
  Widget Function(T)? leadingBuilder,
  Color Function(T)? selectedColorBuilder,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) => MyListPickerBottomSheet<T>(
      title: title,
      items: items,
      labelBuilder: labelBuilder,
      selectedItem: selectedItem,
      leadingBuilder: leadingBuilder,
      selectedColorBuilder: selectedColorBuilder,
    ),
  );
}

class MyListPickerBottomSheet<T> extends StatelessWidget {
  const MyListPickerBottomSheet({
    super.key,
    required this.title,
    required this.items,
    required this.labelBuilder,
    this.selectedItem,
    this.leadingBuilder,
    this.selectedColorBuilder,
  });

  final String title;
  final List<T> items;
  final String Function(T) labelBuilder;
  final T? selectedItem;
  final Widget Function(T)? leadingBuilder;
  final Color Function(T)? selectedColorBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyTextStyles.heading.h22.copyWith(
              color: MyColors.text.primary,
            ),
          ),
          VerticalSpace(16.h),
          ...items.map((item) => _buildItem(context, item)),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, T item) {
    final isSelected = selectedItem == item;
    final selectedColor =
        selectedColorBuilder?.call(item) ?? MyColors.brand.purple;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: leadingBuilder?.call(item),
      title: Text(
        labelBuilder(item),
        style: MyTextStyles.body.body1.copyWith(
          color: isSelected ? selectedColor : MyColors.text.primary,
        ),
      ),
      trailing: isSelected ? Icon(Icons.check, color: selectedColor) : null,
      onTap: () => Navigator.pop(context, item),
    );
  }
}
