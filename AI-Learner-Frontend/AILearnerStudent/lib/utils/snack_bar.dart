import 'package:ailearner/utils/app_colors.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      ),
    ),
  );
}

showToast(BuildContext context, String text) {
  DelightToastBar(

    builder: (context) => ToastCard(
      color: lightGreyColor,
      // leading: icon == null
      //     ? Container()
      //     : const Icon(
      //         Icons.flutter_dash,
      //         size: 28,
      //       ),
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    ),
  ).show(context);
}
