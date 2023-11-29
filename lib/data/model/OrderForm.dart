import 'Sections.dart';
import 'ValueMapping.dart';

class OrderForm {

  String? formName;
  List<Sections>? sections;
  List<ValueMapping>? valueMapping;

  OrderForm({
      this.formName, 
      this.sections, 
      this.valueMapping,
  });

  OrderForm.fromJson(dynamic json) {
    formName = json['formName'];
    if (json['sections'] != null) {
      sections = [];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }

    if (json['valueMapping'] != null) {
      valueMapping = [];
      json['valueMapping'].forEach((v) {
        valueMapping!.add(ValueMapping.fromJson(v));
      });
    }

  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['formName'] = formName;
    map['sections'] = sections;
    map['valueMapping'] = valueMapping;
    return map;
  }

}