import 'package:flutter/material.dart';

class AppbarWidgets {
  static AppBar appBarWidget(BuildContext context, String name) {
    return AppBar(
      title: Text(name),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios)),
    );
  }
}
