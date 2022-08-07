import 'package:daily_news/data/models/news.dart';
import 'package:daily_news/data/web_services/news_webservice.dart';

class NewsRepository {
  final NewsWebService newsWebService;

  NewsRepository(this.newsWebService);

  Future<List<News>> getAllNews() async {
    final news = await newsWebService.getAllNews();
    print(news);
    return news.map((news) => News.fromJson(news)).toList();
  }
}
