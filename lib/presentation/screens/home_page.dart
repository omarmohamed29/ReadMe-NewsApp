import 'package:daily_news/business_logic/cubit/news_cubit.dart';
import 'package:daily_news/presentation/screens/news_page.dart';
import 'package:daily_news/presentation/widgets/allnews.dart';
import 'package:daily_news/presentation/widgets/drawer.dart';
import 'package:daily_news/presentation/widgets/newsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<News> news;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsCubit>(context).getAllNews();
  }

  Widget buildHomePage() {
    return BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
      if (state is NewsLoaded) {
        news = (state)
            .news
            .where((element) =>
                element.imageUrl.toString() != 'null' &&
                element.content.toString() != 'null')
            .toList();
        return buildLoadedNewsWidget();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
      ),
    );
  }

  Widget buildLoadedNewsWidget() {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Theme.of(context).backgroundColor,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "Welcome Back! ",
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline2?.color,
                  fontFamily: 'Montserrat',
                  fontSize: 20),
            ),
          ),
          buildNewsList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommendation",
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline2?.color,
                    fontFamily: 'Montserrat',
                    fontSize: 20),
              ),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "See more",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline2?.color,
                            fontFamily: 'Montserrat',
                            fontSize: 15),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ],
                  ))
            ],
          ),
          buildAllNews(),
        ]),
      ),
    );
  }

  Widget buildAllNews() {
    return SizedBox(
      // height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: news.length,
            itemBuilder: (ctx, index) => AllNews(
                  allNews: news[index],
                )),
      ),
    );
  }

  Widget buildNewsList() {
    return Container(
      height: 400,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          itemCount: news.length,
          itemBuilder: (ctx, index) => NewsItem(
                news: news[index],
              )),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue, size: 30),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
        titleSpacing: 0.0,
        elevation: 0.0,
        title: Text.rich(
          TextSpan(
              text: 'Read',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                fontSize: 21,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: '-Me',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Theme.of(context).textTheme.headline2?.color),
                )
              ]),
        ),
      ),
      drawer: SafeArea(child: const NewsDrawer()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildHomePage(),
      ),
    );
  }
}
