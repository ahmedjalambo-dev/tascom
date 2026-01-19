import 'package:flutter/material.dart';
import 'package:tascom/features/settings/data/models/report_model.dart';
import 'package:tascom/features/settings/widgets/report_card.dart';

import 'package:tascom/features/settings/widgets/reports_empty_state.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String selectedFilter = 'All';

  // Mock data - In a real app, this would come from an API via a Bloc/Cubit
  final List<ReportModel> reports = [
    ReportModel(
      id: '123',
      title: 'Gardening Help Needed for My Backyard',
      imageUrl: 'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae',
      reportedDate: 'Oct 12, 2023',
      status: 'Pending',
      reason: 'Inappropriate or offensive content',
    ),
    ReportModel(
      id: '456',
      title: 'Need Someone to Take Care of My Cat',
      imageUrl: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba',
      reportedDate: 'May 08, 2023',
      status: 'Resolved',
      reason: 'Inappropriate or offensive content',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Reports",
          style: TextStyle(
            color: Color(0xFF251455),
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(16)
          )
        ),
        centerTitle: true,
        backgroundColor: Color(0XFFF9FAFB),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF251455), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
     
      ),
      body: reports.isEmpty ? const ReportsEmptyState() : _buildReportsList(),
    );
  }

  Widget _buildReportsList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Reported",
                style: TextStyle(
                  color: Color(0xFF251455),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            // --- بداية جزء الدروب داون المطور ---
            IntrinsicWidth(
              child: Container(
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20), // شكل الـ Pill بالكامل
                  border: Border.all(
                    color: const Color(0xFFE5E7EB),
                    width: 1, // سمك خفيف وبسيط
                  ),
                ),
                child: Stack(
                  children: [
                    // 1. التصميم المرئي المختصر والأنيق
                    Center( // التأكد من سنترة النص والأيقونة تماماً في المنتصف
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              selectedFilter,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF251455),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              size: 14,
                              color: Color(0xFF251455),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // 2. الوظيفة (خفية فوق الزر)
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedFilter,
                            isExpanded: true,
                            menuWidth: 120, // عرض القائمة المنبثقة
                            alignment: AlignmentDirectional.bottomEnd,
                            items: ['All', 'Pending', 'Resolved'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF251455),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              if (newValue != null) {
                                setState(() => selectedFilter = newValue);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // --- نهاية جزء الدروب داون المطور ---
          ],
        ),
      ),
      Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: reports.length,
            itemBuilder: (context, index) {
              return ReportCard(
                report: reports[index],
                onViewDetails: () {
                  // Navigate to details
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
