import 'package:flutter/material.dart';
import 'package:order_hub/provider/order_provider.dart';
import 'package:order_hub/ui/common/custom_widget.dart';
import 'package:order_hub/ui/common/loader.dart';
import 'package:order_hub/ui/screen/order/widget/field_list_widget.dart';
import 'package:order_hub/ui/screen/order/widget/value_mapping_list_widget.dart';
import 'package:order_hub/utils/route_helper.dart';
import 'package:provider/provider.dart';

import '../invoice/invoice_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OrderProvider>(context, listen: false).fetchOrder();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, provider, child){
      return Scaffold(
        floatingActionButton: (provider.isLoading ) ? null: customFlotingActionButton(
            context: context,
            name: "Order",
            callbackAction: (){

              Navigator.pushNamed(context, RouteHelper.invoiceRoute);
            }
        ),

        appBar: (provider.isLoading ) ? null: customAppBar(context, provider.formName),

        body: SafeArea(
          child: provider.isLoading ? const Center(
            child: Loader(),
          ) :
          CustomScrollView(
            slivers: [

              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (provider.allField.isNotEmpty) ?
                            const FieldListWidget() : Container(),
                            const ValueMappingListWidget(),
                          ],
                        )
                    );
                  },
                  childCount: 1, // 1000 list items
                ),
              ),

            ],
          ),
        ),
      );
    },);
  }
}
