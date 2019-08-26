import 'package:flutter/material.dart';
import 'package:flutter_playground/src/news/src/blocs/stories_provider.dart';
import 'package:flutter_playground/src/news/src/screens/news_details.dart';
import 'package:flutter_playground/src/news/src/screens/news_list_screen.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News',
        home: NewsListScreen(),
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) {
        return NewsListScreen();
      });
    } else {
      return MaterialPageRoute(builder: (context) {
        return NewsDetails();
      });
    }
  }
}
