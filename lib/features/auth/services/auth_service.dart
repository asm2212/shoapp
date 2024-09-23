import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoapp/constants/error_handling.dart';
import 'package:shoapp/constants/global_variables.dart';
import 'package:shoapp/constants/utils.dart';
import 'package:shoapp/features/home/screens/home_screen.dart';
import 'package:shoapp/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shoapp/providers/user_provider.dart';


class AuthService {

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  })
  async {
    try {
      User user = User(
        id: "", 
        name: name,
       password: password, 
       email: email,
       address: "", 
       type: "", 
       token: ""
       );

       http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
   httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        'Failed to create account. Please try again later.',
      );
    }
  }

  
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  
  })
  async {
    try {
 

       http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
           "email":email,
          "password":password,
        }
          ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
   httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        'Failed to create account. Please try again later.',
      );
    }
  }
}

