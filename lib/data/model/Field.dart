
import 'Properties.dart';

class Field {

  int? id;
  String? key;
  String? sectionKey;
  String? sectionName;
  String? value;
  Properties? properties;

  Field({
      this.id, 
      this.key, 
      this.sectionKey,
      this.sectionName,
      this.properties,
  });

  Field.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    key = json['key'];
    properties = json['properties'] != null ? Properties.fromJson(json['properties']) : null;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['key'] = key;
    if (properties != null) {
      map['properties'] = properties!.toJson();
    }
    return map;
  }

}