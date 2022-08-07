import 'package:daily_news/constants/strings.dart';
import 'package:daily_news/presentation/screens/Settings.dart';
import 'package:flutter/material.dart';

class NewsDrawer extends StatefulWidget {
  const NewsDrawer({Key? key}) : super(key: key);

  @override
  State<NewsDrawer> createState() => _NewsDrawerState();
}

class _NewsDrawerState extends State<NewsDrawer> {
  List<String> titles = [
    'Home',
    'Settings',
  ];

  List<bool> isHighLighted = [true, false];

  List<IconData> drawerIcons =[ 
    Icons.house_rounded,
    Icons.settings_outlined
  ];

  bool isRouteSame = false;
  @override
  Widget build(BuildContext context) {
    List drawerFunctions = [
      () {
        Navigator.popUntil(context, (route) {
          if (route.settings.name == homePage) {
            isRouteSame = true;
          }
          return true;
        });
        if (!isRouteSame) {
          Navigator.pop(context);
        }
      },
      () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const Settings()));
      }
    ];
    return Drawer(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
                   Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 4),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Transform.rotate(
                        angle: 40,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.add,
                            size: 30,
                            color: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.color
                          ),
                        ),
                      )),
                ),
            Container(
              color: Theme.of(context).backgroundColor,
              height: MediaQuery.of(context).size.height-83,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: titles.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        for (int i = 0; i < isHighLighted.length; i++) {
                          if (index == i) {
                            setState(() {
                              isHighLighted[index] = true;
                            });
                          } else {
                            isHighLighted[index] = false;
                          }
                        }
                      },
                      child: Column(children: [
                        ListTile(
                          leading: Icon(drawerIcons[index] , 
                          color:
                                    isHighLighted[index] ? Colors.blue : Colors.grey,
                          ),
                          title: Text(
                            titles[index],
                            style: TextStyle(
                                fontSize: 18,
                                color:
                                    isHighLighted[index] ? Colors.blue : Colors.grey),
                          ),
                          onTap: drawerFunctions[index],
                        ),
                      ]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
