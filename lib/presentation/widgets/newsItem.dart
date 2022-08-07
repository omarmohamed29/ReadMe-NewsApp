import 'package:daily_news/presentation/screens/news_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/news.dart';

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
         Navigator.of(context).push( MaterialPageRoute(
          builder: (BuildContext context) => NewsDetails(newsDetails: news)));
      },
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.withOpacity(0.3),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Container(
          width: 300,
          margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          padding: const EdgeInsets.all(4),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 200,
                width: 500,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    news.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                news.category[0],
                style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).textTheme.headline2?.color,
                    fontFamily: 'Montserrat'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                news.title,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).textTheme.headline2?.color,
                  fontFamily: 'Montserrat',
                ),
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      news.author[0],
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).textTheme.headline2?.color,
                        fontFamily: 'Montserrat',
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      DateFormat('dd MM yyy – kk:mm').format(
                        news.publishedAt,
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).textTheme.headline2?.color,
                        fontFamily: 'Montserrat',
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
