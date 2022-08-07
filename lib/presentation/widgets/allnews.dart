import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/news.dart';
import '../screens/news_details.dart';

class AllNews extends StatelessWidget {
  final News allNews;
  const AllNews({ Key? key ,required this.allNews }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap:(){
         Navigator.of(context).push( MaterialPageRoute(
          builder: (BuildContext context) => NewsDetails(newsDetails: allNews)));
      },
      child: Card(
        color: Theme.of(context).backgroundColor,
         elevation: 2.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.withOpacity(0.3),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          children: [
            Padding(padding: const EdgeInsets.all(12),
            child: SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    allNews.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                height: 10,
              ),
              Text(
                    allNews.category[0].toString().toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).textTheme.headline6?.color,
                        fontFamily: 'Montserrat'),
                  ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 250,
                child: Text(
                  allNews.title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).textTheme.headline2?.color,
                    fontFamily: 'Montserrat',
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
              ),
              ],
            )
          ],
        ),
      ),
    );
  }
}