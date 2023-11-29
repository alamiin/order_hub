import 'package:flutter/material.dart';

class TextFiledThreeWidget extends StatefulWidget {
  final String defaultValue;
  final String hintText;
  final String label;
  final int minLength;
  final int maxLength;
  final Function(String) callbackAction;
  const TextFiledThreeWidget({Key? key, required this.defaultValue, required this.hintText, required this.label, required this.minLength, required this.maxLength, required this.callbackAction}) : super(key: key);

  @override
  State<TextFiledThreeWidget> createState() => _TextFiledOneWidgetState();
}

class _TextFiledOneWidgetState extends State<TextFiledThreeWidget> {

  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.defaultValue);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _controller,
        maxLength: widget.maxLength,
        keyboardType: TextInputType.text,
        onChanged: widget.callbackAction,
        decoration: InputDecoration(
          border:  const OutlineInputBorder(),
          labelText: widget.label,
          hintText: widget.hintText,
        ),

      ),
    );
  }
}
