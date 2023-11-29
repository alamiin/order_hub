import 'dart:convert';

import 'package:order_hub/data/model/Item.dart';

class Properties {

  String? type;
  String? defaultValue;
  String? hintText;
  int? minLength;
  int? maxLength;
  String? label;
  List<Item>? listItems;

  Properties({
      this.type, 
      this.defaultValue, 
      this.hintText, 
      this.minLength, 
      this.maxLength, 
      this.label,});

  Properties.fromJson(Map<dynamic, dynamic> json) {
    type = json['type'];
    defaultValue = json['defaultValue'].toString();
    hintText = json['hintText'];
    minLength = json['minLength'];
    maxLength = json['maxLength'];
    label = json['label'];
    if (json['type'] == "dropDownList" && json['listItems'] != null) {
      listItems = [];
      try{
        json['listItems'].forEach((v) {
          listItems!.add(Item.fromJson(v));
        });
      }catch(e){
        List<dynamic> map = jsonDecode(json['listItems']);

       map.forEach((v) {
          listItems!.add(Item.fromJson(v));
        });

      }

    }

  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['defaultValue'] = defaultValue;
    map['hintText'] = hintText;
    map['minLength'] = minLength;
    map['maxLength'] = maxLength;
    map['label'] = label;
    return map;
  }

}