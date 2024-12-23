import 'package:flutter/material.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';

class CustomListTileWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const CustomListTileWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
            ),
            const Icon(
              size: 16,
              Icons.arrow_forward_ios,
              color: BLACK_COLOR,
            )
          ],
        ),
      ),
    );
  }
}
