import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../models/news_model.dart';

class NewsCard extends StatefulWidget {
  final NewsModel news;

  const NewsCard({
    super.key,
    required this.news,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard>
    with SingleTickerProviderStateMixin {
  bool liked = false;
  bool bookmarked = false;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget actionButton(
      IconData icon,
      VoidCallback onTap,
      Color color,
      ) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.15),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: color,
          size: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final news = widget.news;

    return FadeTransition(
      opacity: animation,
      child: Stack(
        fit: StackFit.expand,
        children: [

          CachedNetworkImage(
            imageUrl: news.imageUrl,
            fit: BoxFit.cover,
          ),

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black87,
                ],
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      news.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    news.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    news.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text(
                    "${news.source} • ${news.time}",
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      actionButton(
                        liked
                            ? Icons.favorite
                            : Icons.favorite_border,
                            () {
                          setState(() {
                            liked = !liked;
                          });
                        },
                        liked ? Colors.red : Colors.white,
                      ),

                      actionButton(
                        bookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                            () {
                          setState(() {
                            bookmarked = !bookmarked;
                          });
                        },
                        bookmarked
                            ? Colors.amber
                            : Colors.white,
                      ),

                      actionButton(
                        Iconsax.share,
                            () {
                          //Share application to be done here
                        },
                        Colors.white,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Center(
                    child: Column(
                      children: [

                        Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white70,
                        ),

                        Text(
                          "Swipe for next",
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}