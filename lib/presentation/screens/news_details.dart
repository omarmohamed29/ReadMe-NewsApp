import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/news.dart';

class NewsDetails extends StatelessWidget {
  final News newsDetails;
  const NewsDetails({Key? key, required this.newsDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back , 
                        color: Theme.of(context).textTheme.headline2?.color,
                        size: 25,

                      ))
                ],
              ),
              
                Text(
                newsDetails.category[0].toString().toUpperCase(),
                style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).textTheme.headline6?.color,
                    fontFamily: 'PlayFair'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                newsDetails.title,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).textTheme.headline2?.color,
                  fontFamily: 'PlayFair',
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
                 Text(
                newsDetails.author[0],
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).textTheme.headline6?.color,
                  fontFamily: 'PlayFair',
                ),
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
                Text(
                      DateFormat('dd MM yyy – kk:mm').format(
                        newsDetails.publishedAt,
                      ),
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).textTheme.headline6?.color,
                        fontFamily: 'Montserrat',
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
              ],),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 250,
                width: 500,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    newsDetails.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(children: [
                Text(
                "Description : ",
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.headline6?.color,
                  fontFamily: 'PlayFair',
                ),
              ),
              Text(
                  newsDetails.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).textTheme.headline6?.color,
                    fontFamily: 'PlayFair',
                  ),
                ),
              ],),
               Text(
                newsDetails.content,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).textTheme.headline2?.color,
                  fontFamily: 'PlayFair',
                ),
              ),
              const SizedBox(height: 20,),
              Divider(height: 1,color: Theme.of(context).textTheme.headline6?.color,),
              Text(
                newsDetails.keyWords,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.headline6?.color,
                  fontFamily: 'PlayFair',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
