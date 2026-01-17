import 'package:flutter/material.dart';

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
        title: const Text(
          "App Language",
          style: TextStyle(
            color: Color(0xFF251455),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0XFFF9FAFB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF251455), size: 18,),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Color(0xFF6B39F4)),
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
            const Text(
              "You Selected",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF251455),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(30), // Rounded corners
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
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF251455),
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
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF251455)),
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                ),
                enabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(12),
                   borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                ),
                focusedBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(12),
                   borderSide: const BorderSide(color: Color(0xFF6C38F7)),
                ),
              ),
            ),
            const SizedBox(height: 16),
             Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: filteredLanguages.length,
                  itemBuilder: (context, index) {
                    final lang = filteredLanguages[index];
                    final isSelected = lang['code'] == selectedLanguageCode;
                
                    return Container(
                      color: isSelected ? const Color(0xFFF3EFFF) : Colors.transparent, // Highlight selected
                      child: ListTile(
                        leading: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                           child: Text(lang['flag']!, style: const TextStyle(fontSize: 24)),
                        ),
                        title: Text(
                          lang['name']!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFF251455),
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
