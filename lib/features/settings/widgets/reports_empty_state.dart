import 'package:flutter/material.dart';

class ReportsEmptyState extends StatelessWidget {
  const ReportsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFF9F5FF),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(Icons.search, size: 60, color: Color(0xFF7F56D9)),
            ),
            const SizedBox(height: 24),
            const Text(
              "No reported tasks yet",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF251455),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "There are no tasks reported at the moment.\nIf an issue arises, reported tasks\nwill appear here for review.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF475467),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
