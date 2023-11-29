class Display {

  String? fieldKey;
  String? dataColumn;

  Display({
      this.fieldKey, 
      this.dataColumn,});

  Display.fromJson(Map<dynamic, dynamic> json) {
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