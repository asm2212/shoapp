import 'package:flutter/material.dart';
import 'package:shoapp/constants/error_handling.dart';
import 'package:shoapp/constants/global_variables.dart';
import 'package:shoapp/constants/utils.dart';
import 'package:shoapp/models/user.dart';
import 'package:http/http.dart' as http;


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
}

