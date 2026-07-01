import 'package:flutter/material.dart';

import '../data/news_data.dart';
import '../widgets/news_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return NewsCard(
            news: newsList[index],
          );
        },
      ),
    );
  }
}