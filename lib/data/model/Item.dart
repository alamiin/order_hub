class Item {

  String? name;
  int? value;

  Item({
      this.name, 
      this.value,});

  Item.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['value'] = value;
    return map;
  }

}