import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:http/http.dart' as Http;
import 'package:order_hub/data/local/json_loader.dart';
import 'package:order_hub/data/model/ApiResponse.dart';
import 'package:order_hub/utils/app_constraint.dart';

class ApiClient {
  final int timeoutInSeconds = 30;

  Future<ApiResponse> getData(String uri) async {
    try {
      Http.Response _response = await Http.get(
        Uri.parse(appBaseUrl+uri),
      ).timeout(Duration(seconds: timeoutInSeconds));
      ApiResponse response = await handleResponse(_response);
      if(Foundation.kDebugMode) {
        print('====> API Response: [${response.statusCode}] $uri\n${_response.body}');
      }
      return response;
    } catch (e) {
      return await JsonLoader.getLocalJson();
    }
  }



  Future<ApiResponse> handleResponse(Http.Response response) async {
    dynamic _body = jsonDecode(response.body);
    late ApiResponse _response;
    if(response.statusCode == 200){
      _response = ApiResponse(
        bodyString: utf8.decode(response.bodyBytes),  statusCode: response.statusCode
      );
    }else{
      _response = await JsonLoader.getLocalJson();
    }
    return _response;
  }

}

