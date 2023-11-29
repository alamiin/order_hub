import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:order_hub/data/model/Item.dart';

class CustomDropdownWidget extends StatefulWidget {
  final String defaultValue;
  final String hintText;
  final String label;
  final List<Item> listItems;
  final Function(String) callbackAction;
  CustomDropdownWidget({Key? key, required this.defaultValue, required this.hintText, required this.label, required this.listItems, required this.callbackAction}) : super(key: key);

  @override
  State<CustomDropdownWidget> createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black87),
        borderRadius: const BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontSize: 16),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                widget.hintText,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: widget.listItems
                  .map((Item item) => DropdownMenuItem<String>(
                value: item.name!,
                child: Text(
                  item.name!,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
                  .toList(),
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                  widget.callbackAction(selectedValue!);
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: 240,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
