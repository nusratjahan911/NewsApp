import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/article_model.dart';


class News{

  List<ArticleModel> news =[];

  Future<void> getNews()async{
    final response  = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2026-04-11&sortBy=publishedAt&apiKey=c3d45faba648469ab8ff08f2ea5a8216'));

    var jsonData = jsonDecode(response.body.toString());

    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!= null && element["description"]!= null){
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);

        }

      });

    }

  }
}