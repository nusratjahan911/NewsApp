import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/show_category_model.dart';



class CategoryNews{

  List<ShowCategoryModel> categoryNews =[];

  Future<void> getCategoryNews( String category)async{
    final response  = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=c3d45faba648469ab8ff08f2ea5a8216'));

    var jsonData = jsonDecode(response.body.toString());

    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!= null && element["description"]!= null){
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          categoryNews.add(showCategoryModel);

        }
      });
    }
  }
}