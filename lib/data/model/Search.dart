import 'package:order_hub/data/model/Field.dart';

class Search {

  String? fieldKey;
  String? dataColumn;

  Search({
      this.fieldKey, 
      this.dataColumn,});

  Search.fromJson(dynamic json) {
    fieldKey = json['fieldKey'];
    dataColumn = json['dataColumn'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fieldKey'] = fieldKey;
    map['dataColumn'] = dataColumn;
    return map;
  }

}