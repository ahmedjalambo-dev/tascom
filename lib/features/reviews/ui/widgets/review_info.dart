import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class ReviewInfoPage extends StatelessWidget {
  const ReviewInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.secondary, // استخدام اللون الأبيض من الثيم
      appBar: AppBar(
       backgroundColor: MyColors.background.primary,
  
        elevation: 0,
        centerTitle: true,
        // سهم العودة كما في التصميم
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: MyColors.text.primary, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
        ),
        title: Text(
          "Rate & Feedback",
          style: MyTextStyle.heading.h22.copyWith(fontSize: 18.sp,color: MyColors.text.primary,
          fontWeight: FontWeight.w500
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // العنوان الرئيسي الملون بالبنفسجي
            Text(
              "How we use your feedback",
              style: MyTextStyle.heading.h22.copyWith(
                color: MyColors.text.primary,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 12.h),
            
            // النص التوضيحي الأول
            Text(
              "We share parts of your review with the helper and use it to keep the Tascom\n community safe.",
              style: MyTextStyle.body.body2.copyWith(
                color: MyColors.text.secondary,
                height: 1.5,
              ),
            ),
            SizedBox(height: 32.h),

            // البطاقة الرمادية (Who can see this review)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: MyColors.background.primary, // اللون الرمادي الفاتح من الثيم
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Who can see this review",
                    style: MyTextStyle.heading.h32.copyWith(
                      color: MyColors.text.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Your rating and comment will be shared\n with others on Tascom. Private safely\n reports are never shown publicly.",
                    style: MyTextStyle.body.body2.copyWith(
                      color: MyColors.text.secondary,
                     
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            // قائمة النصائح (Bullet Points)
            _buildBulletPoint("Keep your feedback honest and respectful. Avoid sharing private contact details."),
            _buildBulletPoint("Use the Comment box to mention anything that went especially well or could be improved."),
            _buildBulletPoint("Serious safety concerns? Report them from the task details page in addition to leaving\n a review."),
          ],
        ),
      ),
    );
  }

  // ويدجت مساعدة لإنشاء النقاط (Bullet Points)
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Icon(
              Icons.circle,
              size: 5.r,
              color: MyColors.text.secondary,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: MyTextStyle.caption.captionNotes.copyWith(
                color: MyColors.text.secondary,
                fontSize: 13.sp,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}