import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';

/// Custom floating bottom navigation bar with a curved notch for a FAB.
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onFabTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onFabTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Floating navigation bar with notch
          Positioned(
            bottom: 16.h,
            left: 0,
            right: 0,
            child: Container(
              height: 70.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipPath(
                clipper: _NavBarClipper(),
                child: Container(
                  height: 70.h,
                  color: MyColors.text.white,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Left side items
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _NavBarItem(
                            iconPath: 'assets/icons/navbar/home.svg',
                            activeIconPath:
                                'assets/icons/navbar/home-solid.svg',
                            isActive: currentIndex == 0,
                            onTap: () => onTap(0),
                          ),
                          _NavBarItem(
                            iconPath: 'assets/icons/navbar/search.svg',
                            activeIconPath:
                                'assets/icons/navbar/search-solid.svg',
                            isActive: currentIndex == 1,
                            onTap: () => onTap(1),
                          ),
                        ],
                      ),
                    ),
                    // Center space for FAB
                    SizedBox(width: 90.w),
                    // Right side items
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _NavBarItem(
                            iconPath: 'assets/icons/navbar/ai.svg',
                            activeIconPath: 'assets/icons/navbar/ai-solid.svg',
                            isActive: currentIndex == 2,
                            onTap: () => onTap(2),
                          ),
                          _NavBarItem(
                            iconPath: 'assets/icons/navbar/user.svg',
                            activeIconPath:
                                'assets/icons/navbar/user-solid.svg',
                            isActive: currentIndex == 3,
                            onTap: () => onTap(3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),
          ),
          // Floating Action Button
          Positioned(
            bottom: 46.h,
            child: GestureDetector(
              onTap: onFabTap,
              child: Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  color: MyColors.brand.purple,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.brand.purple.withValues(alpha: 0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Icon(Icons.add, color: Colors.white, size: 32.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual navigation bar item widget.
class _NavBarItem extends StatelessWidget {
  final String iconPath;
  final String activeIconPath;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.iconPath,
    required this.activeIconPath,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: SvgPicture.asset(
          isActive ? activeIconPath : iconPath,
          width: 28.sp,
          height: 28.sp,
          colorFilter: ColorFilter.mode(
            isActive ? MyColors.brand.purple : MyColors.text.third,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

/// Custom clipper for the floating navigation bar with a smooth curved notch.
class _NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final cornerRadius = 10.r.dg;
    final centerX = size.width / 2;
    final notchRadius = 44.r;
    final controlPointDistance = 10.r.dg;

    // Start from top-left, after the corner
    path.moveTo(0, cornerRadius);

    // Top-left corner
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    // Top edge to notch start
    final notchStartX = centerX - notchRadius - controlPointDistance;
    path.lineTo(notchStartX, 0);

    // Small curve going into the circular cutout
    path.quadraticBezierTo(
      centerX - notchRadius,
      0,
      centerX - notchRadius,
      notchRadius * 0.3,
    );

    // Semi-circular arc around the FAB (going upward/inward)
    path.arcToPoint(
      Offset(centerX + notchRadius, notchRadius * 0.15),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    // Small curve coming out of the circular cutout
    final notchEndX = centerX + notchRadius + controlPointDistance;
    path.quadraticBezierTo(centerX + notchRadius, 0, notchEndX, 0);

    // Top edge to top-right corner
    path.lineTo(size.width - cornerRadius, 0);

    // Top-right corner
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);

    // Right edge
    path.lineTo(size.width, size.height - cornerRadius);

    // Bottom-right corner
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - cornerRadius,
      size.height,
    );

    // Bottom edge
    path.lineTo(cornerRadius, size.height);

    // Bottom-left corner
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);

    // Left edge back to start
    path.lineTo(0, cornerRadius);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
