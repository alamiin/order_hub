import 'Display.dart';
import 'Search.dart';

class ValueMapping {
  List<Search>? searchList;
  List<Display>? displayList;
  ValueMapping({
      this.searchList, 
      this.displayList,});
  ValueMapping.fromJson(Map<dynamic, dynamic> json) {
    if (json['searchList'] != null) {
      searchList = [];
      json['searchList'].forEach((v) {
        searchList!.add(Search.fromJson(v));
      });
    }
    if (json['displayList'] != null) {
      displayList = [];
      json['displayList'].forEach((v) {
        displayList!.add(Display.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['searchList'] = searchList;
    map['displayList'] = displayList;
    return map;
  }
}