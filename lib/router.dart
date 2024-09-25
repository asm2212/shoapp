import 'package:flutter/material.dart';
import 'package:shoapp/common/widgets/bottom_bar.dart';
import 'package:shoapp/features/admin/screens/add_product_screen.dart';
import 'package:shoapp/features/auth/screens/auth_screen.dart';
import 'package:shoapp/features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch (routeSettings.name) {
  case AuthScreen.routeName:
       return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
        );
  case HomeScreen.routeName:
       return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
        );
  case BottomBar.routeName:
       return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
        );
  case AddProductScreen.routeName:
       return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
        );
  default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body:  Center(
            child: Text('Page not found'),
          ),
        ),
        );

}
}