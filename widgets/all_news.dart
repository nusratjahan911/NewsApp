import 'package:flutter/material.dart';

import '../screens/article_view_screen.dart';

class AllNews extends StatelessWidget {

  String image, description, title, url;
  AllNews({super.key,required this.image, required this.title, required this.description, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleViewScreen(blogUrl: url)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.network(
                image,
                height: 200,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            SizedBox(height: 5),
            Text(title,
              maxLines: 2,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
            SizedBox(height: 5),
            Text(description,style: TextStyle(fontSize: 16),maxLines: 3,),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}