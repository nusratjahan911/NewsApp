import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/screens/article_view_screen.dart';

class BlogTile extends StatelessWidget {
  const BlogTile({
    super.key, required this.title, required this.description, required this.imageUrl,this.url
  });

  final title, description, imageUrl, url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleViewScreen(blogUrl:url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        child: Image.network(imageUrl, height: 100,width: 150,fit: BoxFit.cover,)),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width/1.7,
                          child: Text(title,
                              maxLines:2,style: GoogleFonts.aBeeZee(textStyle: Theme.of(context).textTheme.displayLarge,color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.w600,fontSize: 17))),
                      SizedBox(height: 5),
                      Container(
                          width: MediaQuery.of(context).size.width/1.7,
                          child: Text(description,style: GoogleFonts.aBeeZee(textStyle: Theme.of(context).textTheme.displayLarge,color: Colors.black26,fontStyle: FontStyle.italic,fontWeight: FontWeight.w600,fontSize: 16))),
                    ],
                  ),
                ],),
            ),
          ),
        ),
      ),
    );
  }
}