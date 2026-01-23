import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({
    super.key,
    required this.lable,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    required this.controller,
    this.validator,
    required this.textInputType,
    required bool obscureText,
    this.prefix,
    this.prefixSvgPath,
  });

  final String lable;
  final EdgeInsets? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final Widget? prefix;
  final String? prefixSvgPath;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefix != null || widget.prefixSvgPath != null) {
      final color = _isFocused ? MyColors.brand.purple : MyColors.border.border;

      Widget iconWidget;
      if (widget.prefixSvgPath != null) {
        iconWidget = SvgPicture.asset(
          widget.prefixSvgPath!,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      } else {
        iconWidget = widget.prefix!;
      }

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: iconWidget,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lable,
          style: MyTextStyle.body.body1.copyWith(color: MyColors.text.primary),
        ),
        VerticalSpace(8.h),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.textInputType,
          obscureText: widget.isObscureText ?? false,
          focusNode: _focusNode,
          style: widget.inputTextStyle ?? Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: _buildPrefixIcon(),
            prefixIconConstraints: (widget.prefix != null || widget.prefixSvgPath != null)
                ? BoxConstraints(
                    minWidth: 24.w,
                    minHeight: 24.h,
                  )
                : null,
            // 1. Padding: Uses Theme defaults unless overridden here
            contentPadding: widget.contentPadding,

            // 2. Borders: Theme handles default styles.
            // We only pass these if the parent widget explicitly provides a custom border.
            focusedBorder: widget.focusedBorder,
            enabledBorder: widget.enabledBorder,

            // 3. Hint: Theme sets the color and style
            hintText: widget.hintText,
            hintStyle:
                widget.hintStyle ?? Theme.of(context).inputDecorationTheme.hintStyle,

            // 4. Icon
            suffixIcon: widget.suffixIcon,

            // 5. Colors: 'filled' and 'fillColor' are removed; the Theme handles them.
          ),
        ),
      ],
    );
  }
}
