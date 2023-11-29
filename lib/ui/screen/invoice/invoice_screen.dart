import 'package:flutter/material.dart';
import 'package:order_hub/provider/order_provider.dart';
import 'package:order_hub/service/pdf_saving_service.dart';
import 'package:order_hub/ui/common/custom_widget.dart';
import 'package:order_hub/ui/common/custom_button.dart';
import 'package:order_hub/ui/common/custom_snackbar.dart';
import 'package:order_hub/utils/language.dart';
import 'package:provider/provider.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.7;
    return WillPopScope(
      onWillPop: () async {

        final value = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Alert'),
            content: const Text(invoiceExitAlert),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<OrderProvider>(context, listen: false).resetOrderValue();
                  Navigator.of(context).pop(true);
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );

        if(value != null){
          return Future.value(value);
        }else{
          return Future.value(false);
        }

      },
      child: Scaffold(

        appBar: customAppBar(context, invoice),
        body: SafeArea(
          child: Consumer<OrderProvider>(builder: (context, provider, child){
            return Column(
              children: [
                Expanded(child: ListView.builder(
                    itemCount: provider.allField.length,
                    itemBuilder: (context,  index) {
                      return (provider.allField[index].value != null) ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text(
                          "${provider.allField[index].properties!.type}: ${provider.allField[index].value!}",
                          style: const TextStyle(fontSize: 18,),
                        ),
                      ): Container() ;
                    })),
                CustomButton(
                    width: buttonWidth,
                    name: saveToFile,
                    onPressed: () async{

                      String data = "";
                      provider.allField.forEach((element) {
                        if(element.value != null){
                          data += "${element.properties!.type}: ${element.value!}";
                          data += "\n";
                        }
                      });

                      bool status = await PdfSavingService.createAndSavePdf(data);
                      if(status){
                        showCustomSnackBar(invoiceSaved, context, isError: false);
                      }else{
                        showCustomSnackBar(invoiceIsNotSaved, context, isError: true);
                      }

                    }
                ),
                const SizedBox(height: 50,)
              ],
            );
          },),
        ),
      ),
    );
  }


}
