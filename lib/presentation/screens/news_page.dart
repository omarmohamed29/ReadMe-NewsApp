import 'package:flutter/material.dart';
class SeeMore extends StatelessWidget {
  const SeeMore({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
               Text(
                 "All-News",
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).textTheme.headline2?.color,
                    fontFamily: 'Montserrat',
                  ),
                ),
                
            ],
          ),
        ),
      ),
    );
  }
}