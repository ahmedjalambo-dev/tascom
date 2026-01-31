import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';

class CustomPillDropdown<T> extends StatefulWidget {
  final T value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemLabelBuilder;
  final double height;
  final double menuWidth;
  final Color? activeTextColor;
  final Color? activeBorderColor;
  final Color? inactiveItemColor;

  const CustomPillDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.itemLabelBuilder,
    this.height = 40.0, // Slightly taller for better touch target
    this.menuWidth = 160.0, // Wider menu to accommodate text
    this.activeTextColor,
    this.activeBorderColor,
    this.inactiveItemColor,
  });

  @override
  State<CustomPillDropdown<T>> createState() => _CustomPillDropdownState<T>();
}

class _CustomPillDropdownState<T> extends State<CustomPillDropdown<T>>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    // Rotates the arrow from 0 degrees to 180 degrees (0.5 turns)
    _rotateAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    setState(() {
      _isOpen = true;
    });
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
  }

  void _closeDropdown() {
    setState(() {
      _isOpen = false;
    });
    _animationController.reverse().then((_) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    // Calculate offset to align the Right side of the menu with the Right side of the button
    final xOffset = size.width - widget.menuWidth.w;
    final yOffset = size.height + 8.h; // 8px gap

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // 1. Transparent Backdrop to detect clicks outside
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeDropdown,
              behavior: HitTestBehavior.opaque,
              child: Container(color: Colors.transparent),
            ),
          ),

          // 2. The Dropdown Menu
          Positioned(
            width: widget.menuWidth.w,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(xOffset, yOffset),
              child: SizeTransition(
                axisAlignment: -1, // Expands from top down
                sizeFactor: _expandAnimation,
                child: Material(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.black.withOpacity(0.08),
                      //     blurRadius: 20,
                      //     offset: const Offset(0, 10),
                      //     spreadRadius: 0,
                      //   ),
                      // ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...widget.items.map((item) {
                            final isSelected = item == widget.value;
                            return InkWell(
                              onTap: () {
                                widget.onChanged(item);
                                _closeDropdown();
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.h,
                                  horizontal: 20.w,
                                ),
                                color: isSelected
                                    ? (widget.activeBorderColor ??
                                              MyColors.brand.purple)
                                          .withOpacity(0.05)
                                    : Colors.transparent,
                                child: Text(
                                  widget.itemLabelBuilder(item),
                                  style: MyTextStyle.body.body1.copyWith(
                                    color: isSelected
                                        ? (widget.activeTextColor ??
                                              MyColors.brand.purple)
                                        : (widget.inactiveItemColor ??
                                              Colors.black87),
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Default colors based on the image provided
    final primaryColor = widget.activeTextColor ?? MyColors.brand.purple;
    final borderColor =
        widget.activeBorderColor ?? MyColors.brand.purple.withOpacity(0.2);

    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          height: widget.height.h,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: _isOpen ? primaryColor : borderColor,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.itemLabelBuilder(widget.value),
                style: MyTextStyle.body.body1.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              HorizontalSpace(8.w),
              RotationTransition(
                turns: _rotateAnimation,
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: primaryColor,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
