import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  final String title;

  const ImagePickerWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200, // Background color
          borderRadius: BorderRadius.circular(4.0), // Rounded corners
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Icon(Icons.camera_alt_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }
}
