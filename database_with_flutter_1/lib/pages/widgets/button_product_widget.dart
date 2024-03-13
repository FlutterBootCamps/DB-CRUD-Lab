import 'package:database_with_flutter_1/helper/colors.dart';
import 'package:flutter/material.dart';

class ButtonCreateWidget extends StatelessWidget {
  const ButtonCreateWidget({
    super.key,
    required this.title,
    required this.onPress,
  });
  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(button),
        elevation: const MaterialStatePropertyAll(3),
      ),
      onPressed: onPress,
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
