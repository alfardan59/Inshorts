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
      backgroundColor: Colors.black,

      body: Stack(
        children: [

          /// News Cards
          PageView.builder(
            controller: controller,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: newsList.length,
            itemBuilder: (_, index) {
              return NewsCard(
                news: newsList[index],
              );
            },
          ),

          /// Navbar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 14,
              ),
              child: Row(
                children: [

                  Image.asset(
                    "assets/images/logo.png",
                    height: 42,
                    width: 42,
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    "Newisfy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}