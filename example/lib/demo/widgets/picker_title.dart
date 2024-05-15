import 'package:flutter/material.dart';

class PickerTitle extends StatelessWidget {
  const PickerTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25.0,
        ),
      ),
    );
  }
}
