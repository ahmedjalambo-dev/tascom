import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class Filterchip extends StatefulWidget {
  final String label;

  const Filterchip({super.key, required this.label});

  @override
  State<Filterchip> createState() => _FilterchipState();
}

class _FilterchipState extends State<Filterchip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),

          side: BorderSide(
            color: isSelected ? MyColors.brand.purple : Colors.grey.shade300,
            width: 1.5,
          ),
          backgroundColor: isSelected ? MyColors.brand.purple : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              style: MyTextStyle.label.label1.copyWith(
                color: isSelected ? Colors.white : MyColors.text.primary,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 4), // space between text and icon
              const Icon(Icons.close, size: 16, color: Colors.white),
            ],
          ],
        ),
      ),
    );
  }
}
