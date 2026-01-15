import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'dart:math' as math;

class CustomProgressIndicator extends StatefulWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNextTap;

  const CustomProgressIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNextTap,
  });

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  double _previousProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _previousProgress = (widget.currentPage + 1) / widget.totalPages;
    _progressAnimation =
        Tween<double>(begin: _previousProgress, end: _previousProgress).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void didUpdateWidget(CustomProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPage != widget.currentPage) {
      _previousProgress = (oldWidget.currentPage + 1) / oldWidget.totalPages;
      final newProgress = (widget.currentPage + 1) / widget.totalPages;

      _progressAnimation =
          Tween<double>(begin: _previousProgress, end: newProgress).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          );

      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onNextTap,
      child: SizedBox(
        width: 92.w,
        height: 92.h,
        child: AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, child) {
            return CustomPaint(
              painter: _ProgressPainter(
                progress: _progressAnimation.value,
                brandColor: MyColors.background.cardHover,
                backgroundColor: MyColors.background.secondary,
              ),
              child: child,
            );
          },
          child: Center(
            child: Container(
              width: 68.w,
              height: 68.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              // icon
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/stroke.svg',
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  final double progress;
  final Color brandColor;
  final Color backgroundColor;

  _ProgressPainter({
    required this.progress,
    required this.brandColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 8.0;

    // Draw background arc (lighter purple)
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -math.pi / 2, // Start from top
      2 * math.pi, // Full circle
      false,
      backgroundPaint,
    );

    // Draw progress arc (brand purple)
    final progressPaint = Paint()
      ..color = brandColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -math.pi / 2, // Start from top
      2 * math.pi * progress, // Progress
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_ProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
