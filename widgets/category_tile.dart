import 'package:flutter/material.dart';

import '../screens/category_news_screen.dart';


class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.image, required this.categoryName});

  final image, categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNewsScreen(name: categoryName)));
      },
      child: Container(
        margin: EdgeInsetsGeometry.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 120,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),

              child: Center(
                child: Text(categoryName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
