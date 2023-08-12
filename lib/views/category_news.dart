import 'package:flutter/material.dart';
import 'package:newsapp2/helper/models/article_model.dart';
import 'package:newsapp2/helper/news.dart';
import 'package:newsapp2/views/home.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;
  const CategoryNews({super.key, required this.newsCategory});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  String? modify_newsCategory;
  List<Article> _newslist = <Article>[];
  bool _loading = true;

  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    modify_newsCategory =
        widget.newsCategory[0].toUpperCase()+ widget.newsCategory.substring(1);
    getnews();
  }

  void getnews() async {
    NewsForCategorie _news = NewsForCategorie();

    _newslist = await _news.getNewsForCategorie(widget.newsCategory);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Container(
          width: MediaQuery.of(context).size.width,

          // color: Color.fromARGB(121, 103, 103, 37),
          margin: EdgeInsets.only(
            left: 10,
            right: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                modify_newsCategory!,
                style: TextStyle(
                  // color: Colors.black,
                  color: Color.fromARGB(255, 255, 98, 0),
                  fontSize: 30,
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: _newslist.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: _newslist[index].urlToImage ?? "",
                        title: _newslist[index].title ?? "",
                        description: _newslist[index].description ?? "",
                        content: _newslist[index].content ?? "",
                        posturl: _newslist[index].articleUrl ?? "",
                      );
                    }),
              ),
            ),
    );
  }
}
