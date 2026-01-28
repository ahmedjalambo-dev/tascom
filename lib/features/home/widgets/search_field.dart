import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/features/home/widgets/my_drop_down.dart';

class SearchField extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController searchController;
  final TextEditingController selectedItem;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;

  const SearchField({
    super.key,
    required this.focusNode,
    required this.searchController,
    required this.selectedItem,
    required this.onChanged,
    required this.onSubmitted,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final List<String> _dropdownItems = ['Tasks', 'People'];

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onTextChange);
  }

  @override
  void dispose() {
    widget.searchController.removeListener(_onTextChange);
    super.dispose();
  }

  void _onTextChange() {
    setState(() {});
  }

  void _clearText() {
    widget.searchController.clear();
    widget.onChanged('');
  }

  bool get _hasText => widget.searchController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: MyColors.background.secondary,
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.searchController,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        style: TextStyle(fontSize: 14.sp, color: MyColors.text.primary),
        decoration: InputDecoration(
          filled: true,
          fillColor: MyColors.background.primary,
          contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 14.sp, color: MyColors.text.third),
          prefixIcon: _buildPrefixIcon(),
          suffixIcon: _buildSuffixIcon(),
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildFocusedBorder(),
        ),
      ),
    );
  }

  Widget _buildPrefixIcon() {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: SvgPicture.asset(
        MyIcons.search,
        width: 20.w,
        height: 20.h,
        colorFilter: ColorFilter.mode(MyColors.icons.icon, BlendMode.srcIn),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_buildActionIcon(), _buildDivider(), _buildDropdown()],
      ),
    );
  }

  Widget _buildActionIcon() {
    if (_hasText) {
      return IconButton(
        onPressed: _clearText,
        icon: SvgPicture.asset(
          MyIcons.cancelSolid,
          width: 20.w,
          height: 20.h,
          colorFilter: ColorFilter.mode(MyColors.text.primary, BlendMode.srcIn),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SvgPicture.asset(
        MyIcons.generatingStroke,
        width: 20.w,
        height: 20.h,
        colorFilter: ColorFilter.mode(MyColors.icons.icon, BlendMode.srcIn),
      ),
    );
  }

  Widget _buildDivider() {
    return VerticalDivider(
      color: MyColors.border.border,
      thickness: 1,
      width: 1,
    );
  }

  Widget _buildDropdown() {
    return SizedBox(
      height: 35.h,
      width: 95.w,
      child: MyDropDown(
        items: _dropdownItems,
        controller: widget.selectedItem,
        onChanged: (value) {
          setState(() => widget.selectedItem.text = value);
        },
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide.none,
    );
  }

  OutlineInputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: MyColors.brand.purple, width: 1.5),
    );
  }
}
