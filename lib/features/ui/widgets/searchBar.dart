import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/features/ui/screen/Result_screen.dart';

import 'package:tascom/features/ui/widgets/CustomDropdown.dart';

class Searchbar extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController searchController;
  final TextEditingController
  selectedItem; // Controller for the selected item of the dropdown
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;

  const Searchbar({
    super.key,
    required this.focusNode,
    required this.searchController,
    required this.selectedItem,
    required this.onChanged,
    required this.onSubmitted,
  });

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  List<String> dropdownItems = ['Tasks', 'People'];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 14,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,

        controller: widget.searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFFDFCFF),
          contentPadding: EdgeInsets.symmetric(
            vertical: 6.h, //  controls height
            horizontal: 16.w,
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Color.fromARGB(255, 6, 6, 6)),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/search2.png',
              width: 16.w,
              height: 16.h,
              fit: BoxFit.contain,
            ),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: Color(0xFF6B39F4), width: 1),
          ),

          suffixIcon: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.searchController.text.isEmpty
                    ? Image.asset(
                        'assets/images/star.png',
                        height: 25,
                        width: 25,
                      )
                    : IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          color: Color.fromARGB(255, 69, 36, 126),
                        ),
                        onPressed: () {
                          widget.searchController.clear();
                        },
                      ),

                const VerticalDivider(
                  color: Color.fromARGB(255, 225, 224, 224),
                  thickness: 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: SizedBox(
                    height: 35.h,
                    width: 100.w,
                    child: CustomDropdownW(
                      items: dropdownItems,
                      jobRoleCtrl: widget.selectedItem,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedItem.text = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}
