import 'package:flutter/material.dart';
import 'package:order_hub/data/model/Sections.dart';

import 'field_list_widget.dart';

class SectionWidget extends StatelessWidget {
  final Sections section;
  const SectionWidget({Key? key, required this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black87, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        children: [
          Text(section.name!),
          (section.fields != null ) ?
          const FieldListWidget() : Container(),
        ],
      ),
    );
  }
}
