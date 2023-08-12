import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp2/helper/data.dart';
import 'package:newsapp2/helper/models/category_model.dart';
import 'package:newsapp2/views/category_news.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helper/models/article_model.dart';
import '../helper/news.dart';
import 'article_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategorieModel> _categories = <CategorieModel>[];
  List<Article> _newslist = <Article>[];
  late bool _loading;

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    _categories = getCategories();
    getnews();
  }

  void getnews() async {
    News _news = News();

    _newslist = await _news.getNews();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Container(
          color: Color.fromARGB(121, 103, 103, 37),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Latest ",
                style: TextStyle(
                  // color: Colors.red,
                  color: Colors.teal,
                  fontSize: 30,
                ),
              ),
              Text(
                "NEWS",
                style: TextStyle(
                  // color: Colors.black,
                   color: Color.fromARGB(255, 255, 98, 0),
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: (_loading)
          ? Center(child: Container(child: const CircularProgressIndicator(color: Colors.teal,)))
          : Container(
              child: Column(
                
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    height: 70,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                              imageUrl: _categories[index].imageAssetUrl,
                              categoryName: _categories[index].categorieName);
                        }),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    margin: const EdgeInsets.all(
                      12,
                    ),
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          itemCount: _newslist.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(), // for scroll
                          itemBuilder: (context, index) {
                            return BlogTile(
                              posturl: _newslist[index].articleUrl ?? "",
                              imageUrl: _newslist[index].urlToImage ?? "",
                              title: _newslist[index].title ?? "",
                              description: _newslist[index].description ?? "",
                              content: _newslist[index].content ?? "",
                            );
                          }),
                    ),
                  ),
                ],
              )),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String? imageUrl, title, description, content, posturl;

  const BlogTile(
      {super.key,
      this.imageUrl,
      this.title,
      this.description,
      this.content,
      required this.posturl});


       Future<void> _loadcontent() async {
          var url = Uri.parse(posturl!);

          try {
            await launchUrl(url);
            print("website open 😊");
          } catch (e) {
            print("website is not open , your error $e");
          }
        }

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ArticleView(
        //               postUrl: posturl,
        //             )));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _loadcontent,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 24,
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                
                imageUrl: imageUrl!,
                placeholder: (context ,url) => Center(child: CircularProgressIndicator(color: Colors.teal,)),
                errorWidget: (context,url,error) => Icon(Icons.error),
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              title!,
              maxLines: 2,
              style: const TextStyle(
                  // color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              description!,
              maxLines: 2,
              style: const TextStyle(
                // color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String? imageUrl, categoryName;

  const CategoryTile(
      {super.key, required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      newsCategory: categoryName!.toLowerCase(),
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                placeholder: (context ,url) => Center(child: CircularProgressIndicator(color: Colors.teal,)),
                errorWidget: (context,url,error) => Icon(Icons.error),
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
