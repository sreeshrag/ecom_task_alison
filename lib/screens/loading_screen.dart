import 'dart:convert';

import 'package:ecom_task/global/api_endpoints.dart';
import 'package:ecom_task/model/guest_user_model.dart';
import 'package:ecom_task/services/api_response.dart';
import 'package:ecom_task/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void _loadUserInfo() async {
    String token = await getToken();
    if (token == '') {
      _guestLogin();
    } else {
      getUserDetailswithToken();
    }

    

  }

  Future getUserDetailswithToken() async {
      String token = await getToken();
      String id = await getId();

      final response = await http.post(Uri.parse(homepageUrl), headers: {'Accept': 'application/json'}, body: {'id': id, 'token': token});
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        debugPrint('guestloginsuccess');
      } else {}
    }
      void _guestLogin() async {
   
 
      try {
        ApiResponse response = await login();
        if (response.error == null) {
          _saveAndRedirectHome(response.data as GuestUser);
        } else {
         

          var er = response.error.toString();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          er,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),);
        }
      } catch (e) {
        
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          content: Text(
            'Something went wrong , try again later',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ));
      }
    
  }

  void _saveAndRedirectHome(GuestUser user) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('token', user.customerdata.token.toString());
      await pref.setString('userid', user.customerdata.id.toString());
      await pref.setString('loginTime', DateTime.now().toString());
     
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoadingScreen()), (route) => false);
     
    } catch (e) {
      
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Something went wrong , try again later',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
