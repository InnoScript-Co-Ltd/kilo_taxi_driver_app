import 'package:flutter/material.dart';

class PreviewImageWidget extends StatelessWidget {
  final String title;
  final String image;
  const PreviewImageWidget({
    super.key,
    required this.title,
    this.image = "",
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
          const SizedBox(height: 4,),
          Container(
            height: 76.0,
            decoration: BoxDecoration(color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4)),
          )
        ],
      ),
    );
  }
}
