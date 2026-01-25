import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/reviews/ui/widgets/feedback_section.dart';
import 'package:tascom/features/reviews/ui/widgets/helper_info_section.dart';
import 'package:tascom/features/reviews/ui/widgets/rating_section.dart';
import 'package:tascom/features/reviews/ui/widgets/task_overview_section.dart';

class RateHelperScreen extends StatelessWidget {
  const RateHelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.secondary,
      appBar: AppBar(
        backgroundColor: MyColors.background.primary,
        elevation: 0,
        centerTitle: true,
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: MyColors.text.primary, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Rate & Feedback",
          style: MyTextStyle.heading.h32.copyWith(color: MyColors.text.primary),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HelperInfoSection(),
            SizedBox(height: 24.h),
             TaskOverviewSection(),
             SizedBox(height: 24.h),
           RatingSection(),
             SizedBox(height: 24.h),
         FeedbackSection(),
     
          ],
        ),
      ),
    );
  }

  // Widget _buildHelperSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "Feedback for helper",
  //         style: MyTextStyle.heading.h32.copyWith(fontSize: 18.sp),
  //       ),
  //       SizedBox(height: 8.h),
  //       Text(
  //         "You are rating the person who completed the task.",
  //         style: MyTextStyle.body.body2.copyWith(color: MyColors.text.secondary),
  //       ),
  //       SizedBox(height: 16.h),
  //       Row(
  //         children: [
  //           CircleAvatar(
  //             radius: 24.r,
  //             backgroundColor: MyColors.background.cardHover,
  //             child: SvgPicture.asset(
  //               'assets/svg/profile_person.svg',
  //               width: 24.w,
  //               colorFilter: ColorFilter.mode(MyColors.brand.purple, BlendMode.srcIn),
  //             ),
  //           ),
  //           SizedBox(width: 12.w),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 "Ali Rayyan",
  //                 style: MyTextStyle.heading.h32.copyWith(color: MyColors.text.primary),
  //               ),
  //               SizedBox(height: 4.h),
  //               Row(
  //                 children: [
  //                   Icon(Icons.star_rounded, color: MyColors.icons.star, size: 16.sp),
  //                   SizedBox(width: 4.w),
  //                   Text(
  //                     "4.5",
  //                     style: MyTextStyle.label.label1.copyWith(color: MyColors.text.primary),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //       SizedBox(height: 16.h),
  //       Row(
  //         children: [
  //           _buildInfoPill(Icons.location_on, "Ramallah, Palestine"),
  //           SizedBox(width: 8.w),
  //           _buildInfoPill(Icons.check_circle_outline, "30 tasks done"),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildInfoPill(IconData icon, String text) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
  //     decoration: BoxDecoration(
  //       color: MyColors.background.cardHover,
  //       borderRadius: BorderRadius.circular(16.r),
  //     ),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Icon(icon, color: MyColors.brand.purple, size: 14.sp),
  //         SizedBox(width: 4.w),
  //         Text(text, style: MyTextStyle.caption.captionNotes.copyWith(color: MyColors.brand.purple)),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildTaskOverviewSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "Task Overview",
  //         style: MyTextStyle.heading.h32.copyWith(fontSize: 18.sp),
  //       ),
  //       SizedBox(height: 12.h),
  //       Container(
  //         padding: EdgeInsets.all(16.w),
  //         decoration: BoxDecoration(
  //           color: MyColors.background.secondary, // White
  //           borderRadius: BorderRadius.circular(16.r),
  //           border: Border.all(color: MyColors.border.border),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Need Help with Grocery Shopping",
  //               style: MyTextStyle.heading.h32.copyWith(fontSize: 16.sp),
  //             ),
  //             SizedBox(height: 16.h),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: _buildTaskAttribute(
  //                     "Priority",
  //                     Container(
  //                       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
  //                       decoration: BoxDecoration(
  //                         color: MyColors.priority.high.bg,
  //                         borderRadius: BorderRadius.circular(8.r),
  //                       ),
  //                       child: Row(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           Icon(Icons.local_fire_department, color: MyColors.priority.high.text, size: 14.sp),
  //                           SizedBox(width: 4.w),
  //                           Text("High Priority", style: MyTextStyle.label.label2.copyWith(color: MyColors.priority.high.text)),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(width: 12.w),
  //                 Expanded(
  //                   child: _buildTaskAttribute(
  //                     "Points",
  //                     Container(
  //                       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(8.r),
  //                         border: Border.all(color: MyColors.brand.purple),
  //                       ),
  //                       child: Row(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           SvgPicture.asset('assets/svg/zap.svg', width: 14.w, colorFilter: ColorFilter.mode(MyColors.brand.purple, BlendMode.srcIn)),
  //                           SizedBox(width: 4.w),
  //                           Text("+300 pts", style: MyTextStyle.label.label2.copyWith(color: MyColors.brand.purple)),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: 12.h),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: _buildTaskAttribute(
  //                     "Category",
  //                     Row(
  //                       children: [
  //                         Icon(Icons.home_repair_service, color: MyColors.brand.purple, size: 16.sp),
  //                         SizedBox(width: 4.w),
  //                         Text("Home Services", style: MyTextStyle.label.label2.copyWith(color: MyColors.brand.purple)),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(width: 12.w),
  //                 Expanded(
  //                   child: _buildTaskAttribute(
  //                     "Status",
  //                     Container(
  //                       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
  //                       decoration: BoxDecoration(
  //                         color: MyColors.status.completed.withOpacity(0.1),
  //                         borderRadius: BorderRadius.circular(8.r),
  //                       ),
  //                       child: Text(
  //                         "Completed",
  //                         style: MyTextStyle.label.label2.copyWith(color: MyColors.status.completed),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

//   Widget _buildTaskAttribute(String label, Widget content) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: MyTextStyle.label.label2.copyWith(color: MyColors.text.secondary)),
//         SizedBox(height: 4.h),
//         content,
//       ],
//     );
//   }

//   Widget _buildRatingSection(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Rate Your Experience",
//               style: MyTextStyle.heading.h32.copyWith(fontSize: 18.sp),
//             ),
//             GestureDetector(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => const _InfoDialog(),
//                 );
//               },
//               child: Icon(Icons.info_outline, color: MyColors.text.secondary, size: 20.sp),
//             ),
//           ],
//         ),
//         SizedBox(height: 4.h),
//         Text(
//           "Your feedback helps improve the community",
//           style: MyTextStyle.body.body2.copyWith(color: MyColors.text.secondary),
//         ),
//         SizedBox(height: 16.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: List.generate(4, (index) => Padding(
//                 padding: EdgeInsets.only(right: 8.w),
//                 child: Icon(Icons.star, color: MyColors.icons.star, size: 32.sp),
//               ))..add(Icon(Icons.star, color: MyColors.border.border, size: 32.sp)),
//             ),
//             Text(
//               "4/5 stars",
//               style: MyTextStyle.label.label1.copyWith(color: MyColors.text.secondary),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildFeedbackInputSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Additional feedback",
//           style: MyTextStyle.heading.h32.copyWith(fontSize: 18.sp),
//         ),
//         SizedBox(height: 12.h),
//         Container(
//           height: 150.h,
//           decoration: BoxDecoration(
//             color: MyColors.background.secondary,
//             borderRadius: BorderRadius.circular(16.r),
//             border: Border.all(color: MyColors.border.border),
//           ),
//           child: TextField(
//             maxLines: null,
//             decoration: InputDecoration(
//               hintText: "Write your feedback here",
//               hintStyle: MyTextStyle.body.body2.copyWith(color: MyColors.text.disable),
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.all(16.w),
//             ),
//             style: MyTextStyle.body.body2.copyWith(color: MyColors.text.primary),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSubmitButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: MyColors.brand.purple,
//           padding: EdgeInsets.symmetric(vertical: 16.h),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
//           elevation: 0,
//         ),
//         onPressed: () {
//         // ScaffoldMessenger.of(context).showSnackBar(
//         //   SnackBar(
//         //     content: Text('تم إرسال ملاحظاتك!'),
//         //     backgroundColor: MyColors.brand.purple,
//         //   ),
//         //);
//       },
//         child: Text(
//           "Submit feedback",
//           style: MyTextStyle.button.primaryButton1.copyWith(color: MyColors.text.white),
//         ),
//       ),
//     );
//   }
// }

// class _InfoDialog extends StatelessWidget {
//   const _InfoDialog();

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//        backgroundColor: MyColors.background.secondary, // White
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
//        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
//        child: Padding(
//          padding: EdgeInsets.all(24.w),
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: [
//              Text(
//                "How we use your feedback",
//                style: MyTextStyle.heading.h22.copyWith(color: MyColors.brand.purple),
//              ),
//              SizedBox(height: 16.h),
//              Text(
//                "We share parts of your review with the helper and use it to keep the Tascom community safe.",
//                style: MyTextStyle.body.body2.copyWith(color: MyColors.text.secondary),
//              ),
//              SizedBox(height: 24.h),
//              Container(
//                padding: EdgeInsets.all(12.w),
//                decoration: BoxDecoration(
//                  color: MyColors.background.primary,
//                  borderRadius: BorderRadius.circular(8.r),
//                ),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                     Text(
//                       "Who can see this review",
//                       style: MyTextStyle.label.label1.copyWith(color: MyColors.text.primary),
//                     ),
//                     SizedBox(height: 4.h),
//                     Text(
//                       "Your rating and comment will be shared with others on Tascom. Private safety reports are never shown publicly.",
//                       style: MyTextStyle.caption.captionNotes.copyWith(color: MyColors.text.secondary, fontSize: 11.sp),
//                     ),
//                  ],
//                ),
//              ),
//              SizedBox(height: 16.h),
//              _buildBulletPoint("Keep your feedback honest and respectful. Avoid sharing private contact details."),
//              _buildBulletPoint("Use the Comment box to mention anything that went especially well or could be improved."),
//              _buildBulletPoint("Serious safety concerns? Report them from the task details page in addition to leaving a review."),
//              SizedBox(height: 24.h),
//              Center(
//                child: TextButton(
//                  onPressed: () => Navigator.pop(context),
//                  child: Text("Close", style: MyTextStyle.button.primaryButton1.copyWith(color: MyColors.brand.purple)),
//                ),
//              ),
//            ],
//          ),
//        ),
//     );
//   }

//   Widget _buildBulletPoint(String text) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 8.h),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//            Padding(
//              padding: EdgeInsets.only(top: 6.h),
//              child: CircleAvatar(radius: 2.r, backgroundColor: MyColors.text.secondary),
//            ),
//            SizedBox(width: 8.w),
//            Expanded(child: Text(text, style: MyTextStyle.caption.captionNotes.copyWith(color: MyColors.text.secondary))),
//         ],
//       ),
//     );
//   }
}
