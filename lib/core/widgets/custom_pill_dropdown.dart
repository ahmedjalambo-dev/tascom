import 'package:flutter/material.dart';

class CustomPillDropdown<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemLabelBuilder;
  final double height;
  final double menuWidth;
  final Color textColor;
  final Color borderColor;
  final double fontSize;

  const CustomPillDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.itemLabelBuilder,
    this.height = 24.0,
    this.menuWidth = 120.0,
    this.textColor = const Color(0xFF251455),
    this.borderColor = const Color(0xFFCCCCCC),
    this.fontSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            // 1. Visual Design
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      itemLabelBuilder(value),
                      style: TextStyle(
                        fontSize: fontSize,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: fontSize + 2,
                      color: textColor,
                    ),
                  ],
                ),
              ),
            ),

            // 2. Functional Component (Hidden)
            Positioned.fill(
              child: Opacity(
                opacity: 0,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    value: value,
                    isExpanded: true,
                    menuWidth: menuWidth,
                    alignment: AlignmentDirectional.bottomEnd,
                    items: items.map((T item) {
                      return DropdownMenuItem<T>(
                        value: item,
                        child: Text(
                          itemLabelBuilder(item),
                          style: TextStyle(
                            fontSize: 14,
                            color: textColor,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: onChanged,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
