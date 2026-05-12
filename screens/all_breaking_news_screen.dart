import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/models/slider_model.dart';

import '../services/news.dart';
import '../services/slider_data.dart';
import '../widgets/all_news.dart';


class AllBreakingNewsScreen extends StatefulWidget {
  String news;
  AllBreakingNewsScreen({super.key,required this.news});


  @override
  State<AllBreakingNewsScreen> createState() => _AllBreakingNewsScreenState();
}

class _AllBreakingNewsScreenState extends State<AllBreakingNewsScreen> {

  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    if (widget.news == "Trending") {
      getNews();
    } else {
      getSlider();
    }

    // if (widget.news == "Breaking") {
    //  getSlider();
    // } else {
    //   getNews();
    // }
  }

  getSlider()async{
    Sliders sliderClass = Sliders();
    await sliderClass.getSliders();
    sliders = sliderClass.sliders;
    setState(() {
      sliders = sliderClass.sliders;
      _loading = false;
    });
  }



  getNews()async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
   setState(() {
     articles = newsClass.news;
     _loading= false;
   });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text("${widget.news} News",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading ? Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: widget.news == "Trending"?   articles.length : sliders.length,
    //itemCount: widget.news == "Breaking"? sliders.length : articles.length,
    itemBuilder: (context,index){
      return AllNews(
        image: widget.news == "Trending"?   articles[index].urlToImage! : sliders[index].urlToImage!,
        //image: widget.news == "Breaking"? sliders[index].urlToImage! : articles[index].urlToImage!,
        title: widget.news == "Trending"?  articles[index].title! : sliders[index].title!,
        //title: widget.news == "Breaking"? sliders[index].title!: articles[index].title!,
        description: widget.news == "Trending"?  articles[index].description! : sliders[index].description!,
        //description: widget.news == "Breaking"? sliders[index].description! : articles[index].description!,
        url: widget.news == "Trending"?   articles[index].url! : sliders[index].url!,
       // url: widget.news == "Breaking"? sliders[index].url! : articles[index].url!,
      );

    }
),

    );
  }
}



