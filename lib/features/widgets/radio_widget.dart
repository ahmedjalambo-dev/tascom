// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:tascom/core/themes/my_colors.dart';
// import 'package:tascom/core/themes/my_text_style.dart';
// import 'package:tascom/features/widgets/selectable_icon.dart';
// import 'package:tascom/features/widgets/selectable_icon_group.dart';

// class RadioWidget extends StatefulWidget {
//   const RadioWidget({super.key});

//   @override
//   State<RadioWidget> createState() => _RadioWidgetState();
// }

// class _RadioWidgetState extends State<RadioWidget> {
//   int isSelect = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       //mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: double.infinity,
//           height: 35,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Radio(
//                 value: 1,
//                 groupValue: isSelect,
//                 onChanged: (int? value) {
//                   setState(() {
//                     isSelect = value!;
//                   });
//                 },
//               ),
//               Text(
//                 'High',
//                 style: MyTextStyle.body.body2.copyWith(
//                   color: MyColors.text.primary,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: double.infinity,
//           height: 35,
//           child: Row(
//             children: [
//               Radio(
//                 value: 2,
//                 groupValue: isSelect,
//                 onChanged: (int? value) {
//                   setState(() {
//                     isSelect = value!;
//                   });
//                 },
//               ),
//               Text(
//                 'Medium',
//                 style: MyTextStyle.body.body2.copyWith(
//                   color: MyColors.text.primary,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: double.infinity,
//           height: 35,
//           child: Row(
//             children: [
//               // InkWell(
//               //   onTap: () {
//               //     setState(() {
//               //       isSelect = 4;
//               //     });
//               //   },
//               //   child: Row(
//               //     mainAxisSize: MainAxisSize.min,
//               //     children: [
//               //       SvgPicture.asset(
//               //         'assets/images/Vector.svg',
//               //         color: isSelect == 4
//               //             ? Colors.purple
//               //             : const Color.fromARGB(255, 251, 250, 250),
//               //       ),
//               //       // Icon(
//               //       //   isSelect == 4
//               //       //       ? SvgPicture.asset('assets/images/Vector.svg')
//               //       //       : Icons.radio_button_unchecked,
//               //       //   color: isSelect == 4 ? Colors.purple : Colors.grey,
//               //       //   size: 22,
//               //       // ),
//               //       const SizedBox(width: 6),
//               //       Text(
//               //         'Low2',
//               //         style: TextStyle(
//               //           color: isSelect == 4 ? Colors.purple : Colors.black,
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               //SelectableIcon(value: 5),
//               Radio(
//                 fillColor: MaterialStateProperty.resolveWith<Color>((states) {
//                   if (states.contains(MaterialState.selected)) {
//                     return Colors.blue; // inner dot color
//                   }
//                   return const Color.fromARGB(
//                     255,
//                     243,
//                     242,
//                     242,
//                   ); // 🔴 OUTER BORDER color
//                 }),
//                 value: 3,
//                 groupValue: isSelect,
//                 onChanged: (int? value) {
//                   setState(() {
//                     isSelect = value!;
//                   });
//                 },
//               ),
//               Text(
//                 'Low',
//                 style: MyTextStyle.body.body2.copyWith(
//                   color: MyColors.text.primary,
//                 ),
//               ),

//               SelectableIconGroup(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
