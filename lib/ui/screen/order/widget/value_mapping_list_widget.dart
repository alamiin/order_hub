import 'package:flutter/material.dart';
import 'package:order_hub/ui/common/loader.dart';
import 'package:provider/provider.dart';

import '../../../../provider/order_provider.dart';
import 'display_list_widget.dart';
import 'search_widget.dart';

class ValueMappingListWidget extends StatefulWidget {

  const ValueMappingListWidget({Key? key}) : super(key: key);

  @override
  State<ValueMappingListWidget> createState() => _ValueMappingListWidgetState();
}

class _ValueMappingListWidgetState extends State<ValueMappingListWidget> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OrderProvider>(context, listen: false).fetchCsvFile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, provider, child){
      return provider.isCsvFileLoading ? const Center(
        child: Loader(),
      ) : const Column(
        children: [
          SearchWidget(),
          DisplayListWidget()
        ],
      );
    },);
  }
}
