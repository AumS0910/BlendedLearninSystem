import 'package:ailearner/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextFieldComponent extends StatelessWidget {
  const AppTextFieldComponent(
      {super.key, required this.text, required this.textEditingController});

  final String text;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        focusColor: lightGreyColor,
        hintText: text,
        hintStyle: const TextStyle(color: Colors.black87, fontSize: 20),
        // filled: true,
        // fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: lightGreyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black87,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: lightGreyColor,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      ),
    );
  }
}
