import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class SearchTextFieldBar extends StatelessWidget {
  TextEditingController searchController;
  final ValueChanged<String> onSearchChanged; // Expect a String input
  SearchTextFieldBar({super.key, required this.searchController, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearchChanged, // Properly pass the String value
      textAlign: TextAlign.center,
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search on products.....',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ColorsManager.grey.withOpacity(0.8),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ColorsManager.borderColor.withOpacity(0.8),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
