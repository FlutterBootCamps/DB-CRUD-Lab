import 'package:flutter/material.dart';
import 'package:flutter_week7_day3/utils/colors.dart';

class TextFieldIconed extends StatelessWidget {
  const TextFieldIconed({
    super.key,
    required this.nameController, required this.hintText, required this.labelText, required this.icon,
  });

  final TextEditingController nameController;
  final String hintText;
  final String labelText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        fillColor: whiteColor,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        prefixIcon: icon
      ),
    );
  }
}
