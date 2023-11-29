import 'package:flutter/material.dart';
import 'package:order_hub/provider/order_provider.dart';
import 'package:order_hub/ui/common/custom_image.dart';
import 'package:provider/provider.dart';

class DisplayListWidget extends StatelessWidget {
  const DisplayListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, provider, child){
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: provider.displayFruitPricesList.length,
          itemBuilder: (context,  index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration:const  BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                    <--- top side
                    color: Colors.black87,
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                      fit: FlexFit.tight,
                      child: Text("${provider.displayFruitPricesList[index].fruit}",
                      textAlign: TextAlign.start,
                      )
                  ),
                  const SizedBox(width: 10,),
                  Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("${provider.displayFruitPricesList[index].cupEquivalentUnit}",
                        textAlign: TextAlign.start,
                      )
                  ),
                  const SizedBox(width: 10,),
                  Flexible(
                    flex: 1,
                      fit: FlexFit.tight,
                      child: CustomImage(
                    image: provider.displayFruitPricesList[index].productImage!,
                    height: 40,
                    width: 65,
                  ))
                ],
              ),
            );
        }
      );
    },);
  }
}
