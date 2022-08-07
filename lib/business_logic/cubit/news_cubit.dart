import 'package:bloc/bloc.dart';
import 'package:daily_news/data/models/news.dart';
import 'package:daily_news/data/repository/news_repository.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;
  List<News> news = [];
  NewsCubit(this.newsRepository) : super(NewsInitial());

  List<News> getAllNews() {
    newsRepository.getAllNews().then((news) {
      emit(NewsLoaded(news));
      this.news = news;
    });
    return news;
  }
}
