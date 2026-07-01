import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home_screen.dart';

class InShortsApp extends StatelessWidget {
  const InShortsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "InShorts Clone",
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.light,

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorSchemeSeed: Colors.red,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),

      home: const HomeScreen(),
    );
  }
}