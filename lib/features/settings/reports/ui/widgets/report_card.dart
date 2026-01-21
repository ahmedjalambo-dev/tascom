import 'package:flutter/material.dart';

import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/settings/reports/data/report_model.dart';

class ReportCard extends StatelessWidget {
  final ReportModel report;
  final VoidCallback onViewDetails;

  const ReportCard({
    super.key,
    required this.report,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.background.secondary, // Card white
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              report.imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
             
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reported on ${report.reportedDate}",
                style: MyTextStyle.label.label1.copyWith(
                  color: MyColors.text.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              _buildStatusChip(report.status),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(right: 48.0), // Force wrapping before the edge
            child: Text(
              report.title,
              style: MyTextStyle.body.body1.copyWith(
                color: MyColors.text.primary,
                fontWeight: FontWeight.bold,
                //هنا بعطى مسافة بين الاسطر اذا النص التف
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(right: 48.0), // Match title's wrapping point
            child: Text(
              "Reason: ${report.reason}",
              style: MyTextStyle.body.body2.copyWith(
                color: MyColors.text.primary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline, size: 16, color: MyColors.text.secondary),
                  const SizedBox(width: 4),
                  Text(
                    "Report ID#${report.id}",
                    style: MyTextStyle.label.label2.copyWith(
                      color: MyColors.text.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: onViewDetails,
                child: Text(
                  "View Details",
                  style: MyTextStyle.label.label1.copyWith(
                    color: MyColors.brand.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color bgColor;
    Color textColor;
    
    if (status.toLowerCase() == 'pending') {
      bgColor = MyColors.status.pendingBg;
      textColor = MyColors.status.pending;
    } else if (status.toLowerCase() == 'resolved') {
      bgColor = MyColors.status.resolvedBg;
      textColor = MyColors.status.resolved;
    } else {
      bgColor = MyColors.states.disabled;
      textColor = MyColors.text.secondary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: MyTextStyle.label.label2.copyWith(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
