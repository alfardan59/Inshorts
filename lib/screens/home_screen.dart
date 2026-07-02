import 'package:flutter/material.dart';

import '../data/news_data.dart';
import '../widgets/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: newsList.length,
        itemBuilder: (_, index) {
          return NewsCard(
            news: newsList[index],
          );
        },
      ),
    );
  }
}