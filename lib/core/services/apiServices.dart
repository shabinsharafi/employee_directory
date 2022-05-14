import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:employee_directory/core/ApiResponse.dart';
import 'package:http/http.dart';

class ApiService {
  Future<ApiResponse> getEmployeeData() async {
    var apiResponse = ApiResponse();
    try {
      Response response = await get(
          Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986"));
      print("response " + response.body);
      if (response.statusCode >= 200 && response.statusCode <= 250) {
        apiResponse.success = true;
        apiResponse.data = json.decode(response.body);
        return apiResponse;
      } else {
        apiResponse.message = "Server Error";
        return apiResponse;
      }
    } on TimeoutException {
      return ApiResponse(message: "Timeout");
    } on SocketException {
      return ApiResponse(message: "Network error");
    } catch (e) {
      return ApiResponse(message: e.toString());
    }
  }
}
