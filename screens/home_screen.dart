import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/slider_model.dart';
import 'package:newsapp/screens/all_breaking_news_screen.dart';
import 'package:newsapp/services/news.dart';
import 'package:newsapp/widgets/category_tile.dart';

import '../services/slider_data.dart';
import '../widgets/blogTile.dart';
import '../widgets/image_widget.dart';
import '../widgets/page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  //List<ArticleModel> trendingArticles = [];

  bool _loading = true;

  int activeIndex = 0;

  @override
  void initState() {
    super.initState();

    categories = getCategories();

    getSlider();
    getNews();
  }

  getSlider() async {
    Sliders sliderClass = Sliders();
    await sliderClass.getSliders();

    setState(() {
      sliders = sliderClass.sliders;
    });
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();

    setState(() {
      articles = newsClass.news;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'News',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'App',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: _loading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Category Section
              SizedBox(
                height: 70,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10),
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      image: categories[index].image,
                      categoryName: categories[index].categoryName,
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              /// Breaking News Title
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Breaking News!!',
                      style: GoogleFonts.aBeeZee(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                            AllBreakingNewsScreen(
                              news: "Breaking",
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'View All',
                        style: GoogleFonts.aBeeZee(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// Slider
              CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder:
                    (context, index, realIndex) {
                  return ImageWidget(
                    context: context,
                    image: sliders[index].urlToImage!,
                    index: index,
                    name: sliders[index].title!,
                  );
                },
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeStrategy:
                  CenterPageEnlargeStrategy.height,

                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// Indicator
              Center(
                child: PageIndicatorWidget(
                  activeIndex: activeIndex,
                  sliders: sliders,
                ),
              ),

              const SizedBox(height: 25),

              /// Trending News Title
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending News!!',
                      style: GoogleFonts.aBeeZee(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                            AllBreakingNewsScreen(
                              news: "Trending ",
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'View All',
                        style: GoogleFonts.aBeeZee(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5),

              /// Trending News List

               Container(
                 child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return BlogTile(
                        url: article.url ?? '',
                        imageUrl: article.urlToImage ?? '',
                        title: article.title ?? '',
                        description: article.description ?? '',
                      );
                    },
                  ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}