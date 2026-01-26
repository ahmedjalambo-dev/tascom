import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguageCode = 'ar';
  //يخزن النص المكتوب فى صندوق البحث لتصفية اللغات
  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  //للتحكم بقائمة اللغات عند السحب (Scroll) وإظهار شريط التمرير.
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> languages = [
    {'name': 'Arabic', 'code': 'ar', 'flag': '🇵🇸'},
    {'name': 'Spanish', 'code': 'es', 'flag': '🇪🇸'},
    {'name': 'French', 'code': 'fr', 'flag': '🇫🇷'},
    {'name': 'German', 'code': 'de', 'flag': '🇩🇪'},
    {'name': 'English', 'code': 'en', 'flag': '🇬🇧'},
    {'name': 'Korean', 'code': 'ko', 'flag': '🇰🇷'},
    {'name': 'Chinese', 'code': 'zh', 'flag': '🇨🇳'},
    {'name': 'Japanese', 'code': 'ja', 'flag': '🇯🇵'},
    {'name': 'Italian', 'code': 'it', 'flag': '🇮🇹'},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // تصفية القائمة بناءً على البحث
    final filteredLanguages = languages.where((lang) {
      return lang['name']!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "App Language",
          style: MyTextStyle.heading.h22.copyWith(color: MyColors.text.primary),
        ),
        centerTitle: true,
        backgroundColor: MyColors.background.primary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: MyColors.text.primary, size: 18.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: MyColors.brand.purple, size: 24.sp),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You Selected",
              style: MyTextStyle.body.body1.copyWith(
                fontWeight: FontWeight.w600,
                color: MyColors.text.primary,
              ),
            ),
            SizedBox(height: 12.h),

            //  صندوق اللغة المختارة حالياً
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0XFFD1C2FC)),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: ListTile(
                leading: _buildCircularFlag(languages.firstWhere((e) => e['code'] == selectedLanguageCode)['flag']!),
                title: Text(
                  //نا عندي قائمة لغات، وبدي أجيب اسم اللغة اللي كودها هو اللغة المختارة حاليًا.
                  languages.firstWhere((e) => e['code'] == selectedLanguageCode)['name']!,
                  style: MyTextStyle.body.body2.copyWith(fontWeight: FontWeight.w500),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              ),
            ),
            SizedBox(height: 24.h),

            // 📦 2️⃣ الصندوق المدمج (البحث + قائمة اللغات)
            Container(
              height: 380.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0XFFD1C2FC)),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  // حقل البحث
                  TextField(
                    controller: _searchController,
                    //هنا هى بمثابة ليسنر كل مرة المستخدم بكتب حرف او بمسح حرف بيشتغل
                    onChanged: (value) => setState(() => searchQuery = value),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: MyTextStyle.body.body2.copyWith(color: MyColors.text.third),
                      prefixIcon: Icon(Icons.search, color: MyColors.text.primary, size: 22.sp),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
                    ),
                  ),
                  Divider(height: 1, color: MyColors.border.border),
                   //قائمة اللغات هنا مع سكرول مخصص
                  Expanded(
                    child: RawScrollbar(
                      //لربط خط السكرول بالقائمة
                      controller: _scrollController,
                      thumbVisibility: true,
                      thickness: 3.w,
                      radius: Radius.circular(10.r),
                      thumbColor: MyColors.border.border.withOpacity(0.5),
                      padding: EdgeInsets.only(right: 6.w),     
                      mainAxisMargin: 25.h, 
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.zero,
                        itemCount: filteredLanguages.length,
                        itemBuilder: (context, index) {
                          final lang = filteredLanguages[index];
                          final isSelected = lang['code'] == selectedLanguageCode;

                          return Container(
                            color: isSelected ? MyColors.background.cardHover : Colors.transparent,
                            child: ListTile(
                              leading: _buildCircularFlag(lang['flag']!),
                              title: Text(
                                lang['name']!,
                                style: MyTextStyle.body.body2,
                              ),
                              onTap: () {
                                setState(() {
                                  selectedLanguageCode = lang['code']!;
                                  // تصفير البحث لتعود القائمة كاملة بعد الاختيار
                                  _searchController.clear();
                                  searchQuery = '';
                                  // إغلاق الكيبورد
                                  FocusScope.of(context).unfocus();
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🎨 دالة بناء العلم الدائري الاحترافي
  Widget _buildCircularFlag(String flagEmoji) {
    return Container(
      width: 32.w,
      height: 32.w,
      clipBehavior: Clip.antiAlias, // لقص محتوى الإيموجي داخل الدائرة
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Transform.scale(
        scale: 2.2, // تكبير الإيموجي لملء الدائرة تماماً
        child: Text(
          flagEmoji,
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
    );
  }
}