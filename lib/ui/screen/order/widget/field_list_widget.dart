import 'package:flutter/material.dart';
import 'package:order_hub/data/model/Field.dart';
import 'package:order_hub/provider/order_provider.dart';
import 'package:provider/provider.dart';

import 'custom_dropdown_widget.dart';
import 'image_widget.dart';
import 'text_field_Two_widget.dart';
import 'text_field_one_widget.dart';
import 'text_field_three_widget.dart';
import 'view_text_widget.dart';

class FieldListWidget extends StatelessWidget {

  const FieldListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, provider, child){
      return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.black87, width: 2)
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: provider.allField.length,
          itemBuilder: (context,  index) {

            Field field = provider.allField[index];

            if(field.key == "text_1"){
              return TextFiledOneWidget(
                defaultValue: field.properties!.defaultValue!,
                hintText: field.properties!.hintText!,
                label: field.properties!.label!,
                minLength: field.properties!.minLength!,
                maxLength: field.properties!.maxLength!,
                callbackAction: (value){
                  provider.allField[index].value = value;
                },
              );
            }else if(field.key == "text_2"){
              return TextFiledTwoWidget(
                defaultValue: field.properties!.defaultValue!,
                hintText: field.properties!.hintText!,
                label: field.properties!.label!,
                callbackAction: (value){
                  provider.allField[index].value = value;
                },
              );
            }else if(field.key == "text_3"){
              return TextFiledThreeWidget(
                defaultValue: field.properties!.defaultValue!,
                hintText: field.properties!.hintText!,
                label: field.properties!.label!,
                minLength: field.properties!.minLength!,
                maxLength: field.properties!.maxLength!,
                callbackAction: (value){
                  provider.allField[index].value = value;
                },
              );
            }else if(field.key == "viewText_1" || field.key == "viewText_2"){
              return ViewTextWidget(
                defaultValue: field.properties!.defaultValue!,
                label: field.properties!.label!,
              );
            }else if(field.key == "image_1"){
              return ImageWidget(
                defaultValue: field.properties!.defaultValue!,
                label: field.properties!.label!,
                callbackAction: (value){
                  provider.allField[index].value = value;
                },
              );
            }else if(field.key == "list_1"){
              return CustomDropdownWidget(
                defaultValue: field.properties!.defaultValue!,
                hintText: field.properties!.hintText!,
                label: field.properties!.label!,
                listItems: field.properties!.listItems!,
                callbackAction: (value){
                  provider.allField[index].value = value;
                },
              );
            }else if(field.key == "title"){
              return Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                //padding: const EdgeInsets.symmetric(horizontal: 10),
                // decoration: BoxDecoration(
                //   color: Colors.blue.shade50,
                //   border: Border.all(width: 1, color: Colors.black87),
                //   borderRadius: const BorderRadius.all(Radius.circular(4))
                // ),
                child: Text(
                  field.sectionName!,
                  style: const TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w700),
                ),
              );
            }

            else{
              return Container(
                height: 10,
                width: double.infinity,
                color: Colors.white,
              );
            }

          },

        ),
      );
    },);
  }
}
