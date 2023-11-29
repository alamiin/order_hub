import 'package:flutter/material.dart';

class ViewTextWidget extends StatelessWidget {
  final String defaultValue;
  final String label;
  const ViewTextWidget({Key? key, required this.defaultValue, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.black87),

      ),
    );
  }
}
