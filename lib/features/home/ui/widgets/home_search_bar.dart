import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';

/// The search bar widget for the home screen with filter options.
class HomeSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final List<String> menuItems;
  final String? selectedMenuItem;
  final ValueChanged<String>? onMenuItemSelected;

  const HomeSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.menuItems = const ['Label 1', 'Label 2', 'Label 3', 'Label 4'],
    this.selectedMenuItem,
    this.onMenuItemSelected,
  });

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  bool _isMenuOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _toggleMenu() {
    if (_isMenuOpen) {
      _closeMenu();
    } else {
      _openMenu();
    }
  }

  void _openMenu() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isMenuOpen = true;
    });
  }

  void _closeMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isMenuOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Tap outside to close
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeMenu,
              behavior: HitTestBehavior.opaque,
              child: Container(color: Colors.transparent),
            ),
          ),
          // Menu dropdown
          Positioned(
            width: 160.w,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(size.width - 160.w - 20.w, size.height + 8.h),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: MyColors.background.secondary,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: MyColors.border.border),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: widget.menuItems.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      final isSelected = item == widget.selectedMenuItem;
                      final isLast = index == widget.menuItems.length - 1;

                      return GestureDetector(
                        onTap: () {
                          widget.onMenuItemSelected?.call(item);
                          _closeMenu();
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? MyColors.brand.purple.withValues(alpha: 0.1)
                                : Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(index == 0 ? 12.r : 0),
                              topRight: Radius.circular(index == 0 ? 12.r : 0),
                              bottomLeft: Radius.circular(isLast ? 12.r : 0),
                              bottomRight: Radius.circular(isLast ? 12.r : 0),
                            ),
                          ),
                          child: Text(
                            item,
                            style: MyTextStyle.body.body1.copyWith(
                              color: MyColors.text.primary,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
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
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
            color: MyColors.background.secondary,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: MyColors.background.cardHover),
          ),
          child: Row(
            children: [
              // Search section
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 18.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/search/search.svg',
                        width: 16.sp,
                        height: 16.sp,
                        colorFilter: ColorFilter.mode(
                          MyColors.brand.purple,
                          BlendMode.srcIn,
                        ),
                      ),
                      HorizontalSpace(8.w),
                      Expanded(
                        child: TextField(
                          controller: widget.controller,
                          onChanged: widget.onChanged,
                          style: MyTextStyle.button.secondaryButton2.copyWith(
                            color: MyColors.text.primary,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: MyTextStyle.button.secondaryButton2
                                .copyWith(color: MyColors.text.third),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Sparkle icon
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SvgPicture.asset(
                  'assets/icons/search/sparkle.svg',
                  width: 24.sp,
                  height: 24.sp,
                  colorFilter: ColorFilter.mode(
                    MyColors.brand.purple,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              // Vertical divider
              Container(width: 1, height: 28.h, color: MyColors.border.border),
              // Menu section
              GestureDetector(
                onTap: _toggleMenu,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Menu',
                        style: MyTextStyle.body.body1.copyWith(
                          color: MyColors.text.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Icon(
                        _isMenuOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 22.sp,
                        color: MyColors.brand.purple,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
