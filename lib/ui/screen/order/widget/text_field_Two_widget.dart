import 'package:flutter/material.dart';

class TextFiledTwoWidget extends StatefulWidget {
  final String defaultValue;
  final String hintText;
  final String label;
  final Function(String) callbackAction;
  const TextFiledTwoWidget({Key? key, required this.defaultValue, required this.hintText, required this.label, required this.callbackAction}) : super(key: key);

  @override
  State<TextFiledTwoWidget> createState() => _TextFiledOneWidgetState();
}

class _TextFiledOneWidgetState extends State<TextFiledTwoWidget> {

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
        keyboardType: TextInputType.number,
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
