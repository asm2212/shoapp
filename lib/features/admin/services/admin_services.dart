import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoapp/constants/error_handling.dart';
import 'package:shoapp/constants/global_variables.dart';
import 'package:shoapp/constants/utils.dart';
import 'package:shoapp/models/product.dart';
import 'package:shoapp/providers/user_provider.dart';
import 'package:http/http.dart' as http;

class AdminServices{
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    try {
      final cloudinary = CloudinaryPublic("dnoqcuwhz", "nye5swkn");
      List<String> imageUrls = [];
      for(int i =0; i < images.length;i++){
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path,folder: name)
        );
        imageUrls.add(res.secureUrl);
      }
       Product product = Product(
        name: name,
         description: description, 
         category: category, 
         quantity: quantity,
          price: price, 
          images: imageUrls
          );

      http.Response res = await  http.post(
          Uri.parse('$uri/admin/add-product'),
          headers: {
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token' : userProvider.user.token
          },
          body: product.toJson(),
          );

        httpErrorHandler(
        response: res,
        context: context,
        onSuccess: () async{
          showSnackBar(
            context, 
            "Product added successfully",
          );
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}