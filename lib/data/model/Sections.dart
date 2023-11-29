import 'package:order_hub/data/model/Field.dart';

class Sections {

  String? name;
  String? key;
  List<Field>? fields;

  Sections({
      this.name, 
      this.key, 
      this.fields,});

  Sections.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    key = json['key'];
    if (json['fields'] != null) {
      fields = [];
      json['fields'].forEach((v) {
        fields!.add(Field.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['key'] = key;
    map['fields'] = fields;
    return map;
  }

}