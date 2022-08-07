// ignore_for_file: prefer_const_constructors

import 'package:daily_news/business_logic/cubit/dynamic_theme_cubit.dart';
import 'package:daily_news/global/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Positioned(
              top: 5,
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: 15.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Setting",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline2?.color,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 80,
                left: 10,
                right: 10,
                child: Column(
                  children: [
                    BlocBuilder<DynamicThemeCubit, DynamicThemeState>(
                        builder: (context, state) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () => context
                                .read<DynamicThemeCubit>()
                                .changeTheme(AppTheme.darkMode),
                            title: Row(
                              children: [
                                Text(
                                  "Dark Mode",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.color,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat",
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              "Note : the app will restart after changing the theme directly",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.color,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat",
                                  fontSize: 8),
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 10, top: 10, right: 10),
                          ),
                          ListTile(
                            onTap: () => context
                                .read<DynamicThemeCubit>()
                                .changeTheme(AppTheme.lightMode),
                            title: Row(
                              children: [
                                Text(
                                  "Light Mode",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.color,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat",
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              "Note : the app will restart after changing the theme directly",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.color,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat",
                                  fontSize: 8),
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 10, top: 10, right: 10),
                          )
                        ],
                      );
                    }),
                    Divider(
                      thickness: 1.0,
                      height: 8,
                    ),
                  ],
                )),
          ],
        ));
  }
}
