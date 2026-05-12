import 'package:flutter/material.dart';
import 'package:newsapp/models/show_category_model.dart';
import 'package:newsapp/screens/article_view_screen.dart';
import 'package:newsapp/services/show_category_news.dart';
import 'package:newsapp/widgets/blogTile.dart';
import 'package:newsapp/widgets/show_category.dart';

class CategoryNewsScreen extends StatefulWidget {
  String name;
  CategoryNewsScreen({super.key, required this.name});

  @override
  State<CategoryNewsScreen> createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {

  List<ShowCategoryModel> categoryList = [];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getCategoryNews();

  }



  getCategoryNews()async{
    CategoryNews categoryNews = CategoryNews();
    await categoryNews.getCategoryNews(widget.name.toLowerCase());
    categoryList = categoryNews.categoryNews;
    setState(() {
      _loading = false;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(widget.name,
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            itemCount: categoryList.length,
            itemBuilder: (context,index){
              return ShowCategory(
                image: categoryList[index].urlToImage!,
                title: categoryList[index].title!,
                description: categoryList[index].description!,
                url: categoryList[index].url!,
              );

            }
        ),
      ),
    );
  }
}
