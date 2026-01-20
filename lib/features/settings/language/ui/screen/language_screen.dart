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
  String selectedLanguageCode = 'ar'; // Default to Arabic as per design image
  //🔹 هذا يخزن النص اللي بكتبه المستخدم في البحث
  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
//قائمة البيانات
  final List<Map<String, String>> languages = [
    {'name': 'Arabic', 'code': 'ar', 'flag': '🇵🇸'}, 
    {'name': 'Spanish', 'code': 'es', 'flag': '🇪🇸'},
    {'name': 'French', 'code': 'fr', 'flag': '🇫🇷'},
    {'name': 'German', 'code': 'de', 'flag': '🇩🇪'},
    {'name': 'English', 'code': 'en', 'flag': '🇬🇧'},
    {'name': 'Korean', 'code': 'ko', 'flag': '🇰🇷'},
  ];

  @override
  Widget build(BuildContext context) {
    // Filter languages based on search query
    //تصفية اللغات
    final filteredLanguages = languages.where((lang) {
      return lang['name']!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    // Get selected language map
    final selectedLangMap = languages.firstWhere(
      (lang) => lang['code'] == selectedLanguageCode,
      orElse: () => languages.first,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "App Language",
          style: MyTextStyle.heading.h22.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColors.background.primary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: MyColors.text.primary,
            size: 18.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: MyColors.brand.purple, size: 24.sp),
            onPressed: () {
              Navigator.pop(context); // Confirm selection and go back
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
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
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.border.border),
                borderRadius: BorderRadius.circular(30.r), // Rounded corners
              ),
              child: ListTile(
                leading: Container(
                  width: 30, 
                  height: 30,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                   child: Text(selectedLangMap['flag']!, style: const TextStyle(fontSize: 24)),
                ),
                title: Text(
                  selectedLangMap['name']!,
                  style: MyTextStyle.body.body2.copyWith(
                    fontWeight: FontWeight.w500,
                    color: MyColors.text.primary,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
            ),
            const SizedBox(height: 24),
            // Search Bar
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: MyTextStyle.body.body2.copyWith(
                  color: MyColors.text.third,
                ),
                prefixIcon: Icon(Icons.search, color: MyColors.text.primary, size: 20.sp),
                contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: MyColors.border.border),
                ),
                enabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(12.r),
                   borderSide: BorderSide(color: MyColors.border.border),
                ),
                focusedBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(12.r),
                   borderSide: BorderSide(color: MyColors.brand.purple),
                ),
              ),
            ),
            const SizedBox(height: 16),
             Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.border.border),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: filteredLanguages.length,
                  itemBuilder: (context, index) {
                    final lang = filteredLanguages[index];
                    final isSelected = lang['code'] == selectedLanguageCode;
                
                    return Container(
                      color: isSelected ? MyColors.background.cardHover : Colors.transparent, // Highlight selected
                      child: ListTile(
                        leading: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                           child: Text(lang['flag']!, style: const TextStyle(fontSize: 24)),
                        ),
                        title: Text(
                          lang['name']!,
                          style: MyTextStyle.body.body2.copyWith(
                            color: MyColors.text.primary,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedLanguageCode = lang['code']!;
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
    );
  }
}
