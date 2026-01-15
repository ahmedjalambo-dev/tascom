import 'package:flutter/material.dart';

class TaskTabs extends StatelessWidget {
  final bool isPostedSelected;
  final VoidCallback onPostedTap;
  final VoidCallback onClaimedTap;

  const TaskTabs({
    super.key,
    required this.isPostedSelected,
    required this.onPostedTap,
    required this.onClaimedTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        
        color: Color(0xffEEEEF5),

        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onPostedTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isPostedSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: isPostedSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  "Posted",
                  style: TextStyle(
                    color: isPostedSelected
                        ? const Color(0xFF6B39F4)
                        : const Color(0xFF6E6E6E),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onClaimedTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !isPostedSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: !isPostedSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  "Claimed",
                  style: TextStyle(
                    color: !isPostedSelected
                        ? const Color(0xFF6C38F7)
                        : const Color(0xFF757575),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
