import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final news = widget.news;

    return FadeTransition(
      opacity: animation,
      child: Stack(
        fit: StackFit.expand,
        children: [

          /// Background Image
          CachedNetworkImage(
            imageUrl: news.imageUrl,
            fit: BoxFit.cover,
          ),

          /// Gradient Overlay
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

          /// News Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 25,
              ),
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
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      news.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    news.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    news.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "${news.source} • ${news.time}",
                    style: const TextStyle(
                      color: Colors.white60,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white70,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Swipe Up",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Right Side Buttons
          Positioned(
            right: 15,
            bottom: 280,
            child: Column(
              children: [

                /// Like
                GestureDetector(
                  onTap: () {
                    setState(() {
                      liked = !liked;
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.black54,
                        child: Icon(
                          liked
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              liked ? Colors.red : Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Like",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// Bookmark
                GestureDetector(
                  onTap: () {
                    setState(() {
                      bookmarked = !bookmarked;
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.black54,
                        child: Icon(
                          bookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: bookmarked
                              ? Colors.amber
                              : Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// Share
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Share feature coming soon",
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.black54,
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Share",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}