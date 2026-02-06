import 'package:ailearner/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@override
PreferredSizeWidget appBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    backgroundColor: lightPurpleColor,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        CupertinoIcons.arrowtriangle_left_circle,
        size: 40,
      ),
    ),
  );
}
