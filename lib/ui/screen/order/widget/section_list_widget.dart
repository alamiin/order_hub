import 'package:flutter/material.dart';
import 'package:order_hub/data/model/Sections.dart';
import 'package:order_hub/ui/screen/order/widget/section_widget.dart';

class SectionListWidget extends StatelessWidget {
  final List<Sections> sections;
  const SectionListWidget({Key? key, required this.sections}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return sections.isNotEmpty ? Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      // margin: const EdgeInsets.all(4),
      // decoration: BoxDecoration(
      //     color: Colors.blue,
      //     border: Border.all(color: Colors.black87, width: 1),
      //     borderRadius: const BorderRadius.all(Radius.circular(8))
      // ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: sections.length,
        itemBuilder: (context,  index) {
          return SectionWidget(section: sections[index]);
        },

      ),
    ): Container();
  }
}
