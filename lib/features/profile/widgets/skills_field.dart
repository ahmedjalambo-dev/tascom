import 'package:flutter/material.dart';

class SkillsField extends StatefulWidget {
  const SkillsField({super.key});

  @override
  State<SkillsField> createState() => _SkillsFieldState();
}

class _SkillsFieldState extends State<SkillsField> {
  final TextEditingController _controller = TextEditingController();
  // Pre-populating with some skills to match screenshot example "Skill A", "Skill B"
  final List<String> _skills = ['Skill A', 'Skill B'];

  void _addSkill() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    if (!_skills.contains(text)) {
      setState(() {
        _skills.add(text);
        _controller.clear();
      });
    } else {
      _controller.clear();
    }
  }

  void _removeSkill(String skill) {
    setState(() {
      _skills.remove(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skills",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.deepPurple[900],
              ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ..._skills.map(
                (skill) => Chip(
                  backgroundColor: const Color(0xFFF3E8FF), // Light purple bg
                  labelStyle: const TextStyle(
                      color: Color(0xFF6C38F7), fontWeight: FontWeight.bold),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  label: Text(skill),
                  deleteIcon: const Icon(Icons.close, size: 18, color: Colors.grey),
                  onDeleted: () => _removeSkill(skill),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 150),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "Select Skills ...",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  onSubmitted: (_) => _addSkill(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
