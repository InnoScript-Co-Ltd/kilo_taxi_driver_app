import 'package:flutter/material.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';

class PreviewContentWidget extends StatelessWidget {
  final String title;
  final String content;
  const PreviewContentWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
          ),
          Text(
            content,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: TEXT_COLOR.withOpacity(0.4)),
          )
        ],
      ),
    );
  }
}
