import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  Color col1 = MyColors.brand.purple;

  Color col2 = MyColors.background.primary;
  Color col3 = MyColors.text.primary;
  List select = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 1.w,
      runSpacing: 1.h,
      children: [
        ElevatedButton.icon(
          icon: SvgPicture.asset(
            'assets/images/PetCare2.svg',
            color: select[0] == true ? col2 : col3,
          ),
          label: Text(
            'Pet Care',
            style: MyTextStyle.label.label1.copyWith(
              color: select[0] == true ? col2 : col3,
            ),
          ),
          onPressed: () {
            setState(() {
              select[0] = select[0] == false;
              print(select[0]);
            });
          },

          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: select[0] == true ? col1 : col2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        ElevatedButton.icon(
          icon: SvgPicture.asset(
            'assets/images/Repairs.svg',
            color: select[1] == true ? col2 : col3,
          ),
          label: Text(
            'Repairs',
            style: MyTextStyle.label.label1.copyWith(
              color: select[1] == true ? col2 : col3,
            ),
          ),
          onPressed: () {
            setState(() {
              select[1] = select[1] == false;
              print(select[1]);
            });
          },

          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: select[1] == true ? col1 : col2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        ElevatedButton.icon(
          icon: SvgPicture.asset(
            'assets/images/Tutoring.svg',
            color: select[2] == true ? col2 : col3,
          ),
          label: Text(
            'Tutoring',
            style: MyTextStyle.label.label1.copyWith(
              color: select[2] == true ? col2 : col3,
            ),
          ),
          onPressed: () {
            setState(() {
              select[2] = select[2] == false;
              print(select[2]);
            });
          },

          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: select[2] == true ? col1 : col2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        ElevatedButton.icon(
          icon: SvgPicture.asset(
            'assets/images/Errands.svg',
            color: select[3] == true ? col2 : col3,
          ),
          label: Text(
            'Errands',
            style: MyTextStyle.label.label1.copyWith(
              color: select[3] == true ? col2 : col3,
            ),
          ),
          onPressed: () {
            setState(() {
              select[3] = select[3] == false;
              print(select[3]);
            });
          },

          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: select[3] ? col1 : col2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        ElevatedButton.icon(
          icon: SvgPicture.asset(
            'assets/images/Transportation.svg',
            color: select[4] == true ? col2 : col3,
          ),
          label: Text(
            'Transportation',
            style: MyTextStyle.label.label1.copyWith(
              color: select[4] == true ? col2 : col3,
            ),
          ),
          onPressed: () {
            setState(() {
              select[4] = select[4] == false;
              print(select[4]);
            });
          },

          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: select[4] == true ? col1 : col2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        ElevatedButton.icon(
          icon: SvgPicture.asset(
            'assets/images/Home_services.svg',
            color: select[5] == true ? col2 : col3,
          ),
          label: Text(
            'Home services',
            style: MyTextStyle.label.label1.copyWith(
              color: select[5] == true ? col2 : col3,
            ),
          ),
          onPressed: () {
            setState(() {
              select[5] = select[5] == false;
              print(select[5]);
            });
          },

          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: select[5] == true ? col1 : col2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ],
    );
  }
}
