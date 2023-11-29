import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class CsvLoader{

  Future<List<List<dynamic>>> loadCsvFile(String path) async {
    final _rawData = await rootBundle.loadString(path);
    List<List<dynamic>> _listData = const CsvToListConverter().convert(_rawData);
    return _listData;
  }

}