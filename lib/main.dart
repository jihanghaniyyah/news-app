// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/article_webview.dart';
import 'package:news_app/ui/article_detail_page.dart';
import 'package:news_app/ui/home_page.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/common/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
          onPrimary: Colors.black,
          secondary: secondaryColor,
        ),
        textTheme: myTextTheme,
        appBarTheme: const AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(),
            shape: const  RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: secondaryColor),
          unselectedIconTheme: const IconThemeData(color: Color.fromRGBO(158, 158, 158, 1)),
          selectedItemColor: const Color.fromRGBO(158, 158, 158, 1),
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ArticleDetailPage.routeName: (context) =>
            ArticleDetailPage(article: ModalRoute.of(context).settings.arguments),
        ArticleWebView.routeName: (context) => ArticleWebView(
          url: ModalRoute.of(context).settings.arguments,
        )
      },
    );
  }
}