import 'dart:convert';

import 'package:ecom_task/global/api_endpoints.dart';
import 'package:ecom_task/model/guest_user_model.dart';
import 'package:ecom_task/services/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}
Future<String> getId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('userid') ?? '';
}


Future<ApiResponse> login() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(guestLoginUrl), headers: {'Accept': 'application/json'}, body: {});

    if (response.statusCode == 200) {
      apiResponse.data = GuestUser.fromJson(jsonDecode(response.body));
      // print('loggedin');
    } else {
      apiResponse.error = 'unauthorized';
    }
  } catch (e) {
    apiResponse.error = 'serverError';
  }
  return apiResponse;
}
