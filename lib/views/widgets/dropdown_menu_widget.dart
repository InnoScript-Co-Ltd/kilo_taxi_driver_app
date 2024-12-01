import 'package:flutter/material.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';

class DropDownMenuWidget extends StatelessWidget {
  final String title;

  const DropDownMenuWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200, // Background color
            borderRadius: BorderRadius.circular(4.0), // Rounded corners
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 12.0, fontWeight: FontWeight.w400),
              ),
              const DropdownMenu(
                expandedInsets: EdgeInsets.zero,
                dropdownMenuEntries: [],
                requestFocusOnTap: true,
                trailingIcon: Icon(size: 24, Icons.keyboard_arrow_down),
                selectedTrailingIcon: Icon(size: 24, Icons.keyboard_arrow_up),
                inputDecorationTheme: InputDecorationTheme(
                  isDense: true,
                  constraints: BoxConstraints(maxHeight: 44),
                  labelStyle: TextStyle(color: TEXT_COLOR),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          )),
    );
  }
}
