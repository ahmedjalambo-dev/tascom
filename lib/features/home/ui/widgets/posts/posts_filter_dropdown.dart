import 'package:flutter/material.dart';
import 'package:tascom/core/widgets/my_filter_dropdown.dart';

/// A string-based filter dropdown for posts.
/// This is a convenience wrapper around [MyFilterDropdown<String>].
class PostsFilterDropdown extends StatefulWidget {
  final List<String> items;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const PostsFilterDropdown({
    super.key,
    required this.items,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<PostsFilterDropdown> createState() => _PostsFilterDropdownState();
}

class _PostsFilterDropdownState extends State<PostsFilterDropdown> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return MyFilterDropdown<String>(
      items: widget.items,
      selectedValue: _selectedValue,
      labelBuilder: (item) => item,
      onChanged: (value) {
        if (value != null) {
          setState(() => _selectedValue = value);
          widget.onChanged?.call(value);
        }
      },
    );
  }
}
