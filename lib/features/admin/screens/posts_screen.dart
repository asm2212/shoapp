import 'package:flutter/material.dart';
import 'package:shoapp/features/admin/screens/add_product_screen.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  void navigateToAddProduct(){
    Navigator.pushNamed(
      context,AddProductScreen.routeName
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: const Text(
      "products"
      ),
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.add),
        onPressed: navigateToAddProduct,
        tooltip: "Add a Products",
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}