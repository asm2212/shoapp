import 'package:flutter/material.dart';
import 'package:shoapp/constants/global_variables.dart';
import 'package:shoapp/features/home/screens/category_deals_screen.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

void navigateToCategoryPage(BuildContext context,String category){
  Navigator.pushNamed(context, CategoryDealsScreen.routeName,arguments:category);
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: GlobalVariables.categoryImages.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
        itemBuilder: (context,index){
          return GestureDetector(
           onTap: () => navigateToCategoryPage(
            context,
            GlobalVariables.categoryImages[index]['title']!,
           ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                    ),
                ),
                Text(
                  GlobalVariables.categoryImages[index]['title']!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }
        ),
    );
  }
}