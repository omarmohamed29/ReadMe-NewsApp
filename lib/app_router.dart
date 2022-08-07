import 'package:daily_news/business_logic/cubit/news_cubit.dart';
import 'package:daily_news/data/repository/news_repository.dart';
import 'package:daily_news/data/web_services/news_webservice.dart';
import 'package:flutter/material.dart';
import './presentation/screens/home_page.dart';
import './constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late NewsCubit newsCubit;
  late NewsRepository newsRepository;

  AppRouter() {
    newsRepository = NewsRepository(NewsWebService());
    newsCubit = NewsCubit(newsRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => newsCubit,
                  child: const HomePage(),
                ));
    }
  }
}
