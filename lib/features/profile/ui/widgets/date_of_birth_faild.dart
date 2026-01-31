import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class CustomDatePicker extends StatelessWidget {
  final String initialValue; // نغيرها لـ String لتناسب حقل النص
  final TextEditingController? controller;

  const CustomDatePicker({
    super.key,
    this.initialValue = "01/01/2026",
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // نستخدم controller إذا كان موجوداً، وإلا نضع القيمة الافتراضية
    final textController = controller ?? TextEditingController(text: initialValue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date of birth",
          style: MyTextStyle.body.body1.copyWith(
            fontWeight: FontWeight.w600,
            color: MyColors.text.primary,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: textController,
          decoration: InputDecoration(
            hintText: "DD/MM/YYYY",
            contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            filled: true,
            fillColor: MyColors.background.secondary,
            // تنسيق الحدود لتكون دائرية وخفيفة كما في الصورة
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: MyColors.border.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: MyColors.brand.purple),
            ),
          ),
          style: MyTextStyle.body.body2.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class CustomDatePicker extends StatefulWidget {
//   final DateTime? initialDate;
//   final Function(DateTime) onDateSelected;

//   const CustomDatePicker({
//     Key? key,
//     this.initialDate,
//     required this.onDateSelected,
//   }) : super(key: key);

//   @override
//   State<CustomDatePicker> createState() => _CustomDatePickerState();
// }

// class _CustomDatePickerState extends State<CustomDatePicker> {
//   late DateTime selectedDate;



//   @override
//   void initState() {
//     super.initState();
//     selectedDate = widget.initialDate ?? DateTime.now();
//   }

//   Future<void> _pickDate() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//       widget.onDateSelected(picked);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Date of birth",
//           style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                 fontWeight: FontWeight.w500,
//                 color: Colors.deepPurple[900],
//               ),
//         ),
//         const SizedBox(height: 8),
//         GestureDetector(
//           onTap: _pickDate,
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey.shade200),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   DateFormat('dd/MM/yyyy').format(selectedDate),
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 const Icon(Icons.calendar_month, color: Colors.purple),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
