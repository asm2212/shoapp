// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:  InputDecoration(
        hintText: hintText,
        border:  const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black38,
        ),
        ),
        enabledBorder:  const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black38,
        ),
        ),
      ),
    validator: (val){
      if( val == null || val.isEmpty){
        return "Enter your $hintText";
      }
      return null;
    },
    );
  }
}
