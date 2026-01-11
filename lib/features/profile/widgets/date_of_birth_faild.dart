import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final String initialValue; // نغيرها لـ String لتناسب حقل النص
  final TextEditingController? controller;

  const CustomDatePicker({
    Key? key,
    this.initialValue = "01/01/2026",
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // نستخدم controller إذا كان موجوداً، وإلا نضع القيمة الافتراضية
    final textController = controller ?? TextEditingController(text: initialValue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date of birth",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600, // حسب الديزاين FontWeight.w600
            color: const Color(0xFF1A1A40), // لون داكن قريب من الأسود البنفسجي
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: textController,
          decoration: InputDecoration(
            hintText: "DD/MM/YYYY",
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            filled: true,
            fillColor: Colors.white,
            // تنسيق الحدود لتكون دائرية وخفيفة كما في الصورة
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade100, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.purple, width: 1),
            ),
          ),
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
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
