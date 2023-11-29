import 'package:flutter/services.dart';

import '../model/ApiResponse.dart';

class JsonLoader{
  static Future<ApiResponse> getLocalJson() async {
    final String response = await rootBundle.loadString('assets/response.json');
    return ApiResponse(bodyString: response, statusCode: 200);
  }
}