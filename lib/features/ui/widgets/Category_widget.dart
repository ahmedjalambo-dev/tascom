import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/ui/widgets/CategoryButton.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final List<Map<String, String>> categories = [
    {'label': 'Pet Care', 'icon': 'assets/images/PetCare2.svg'},
    {'label': 'Repairs', 'icon': 'assets/images/Repairs.svg'},
    {'label': 'Tutoring', 'icon': 'assets/images/Tutoring.svg'},
    {'label': 'Errands', 'icon': 'assets/images/Errands.svg'},
    {'label': 'Transportation', 'icon': 'assets/images/Transportation.svg'},
    {'label': 'Home services', 'icon': 'assets/images/Home_services.svg'},
  ];

  List<bool> selected = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: List.generate(categories.length, (index) {
        return SizedBox(
          height: 28.h,
          child: CategoryButton(
            icon: categories[index]['icon']!,
            label: categories[index]['label']!,
            isSelected: selected[index],
            onTap: () {
              setState(() {
                selected[index] = !selected[index];
              });
            },
          ),
        );
      }),
    );
  }
}
