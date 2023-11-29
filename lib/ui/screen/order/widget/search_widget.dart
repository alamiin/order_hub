import 'package:flutter/material.dart';
import 'package:order_hub/provider/order_provider.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
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
        keyboardType: TextInputType.text,
        onChanged: (value){
          Provider.of<OrderProvider>(context, listen: false).searchInCsvFile(value);
        },
        decoration: const InputDecoration(
          border:  OutlineInputBorder(),
          labelText: "Search here",
          hintText: "Apples",
        ),
      ),
    );
  }
}
