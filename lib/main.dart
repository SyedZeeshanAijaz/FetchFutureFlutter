import 'package:fetch_api/screens/home_page.dart';
import 'package:fetch_api/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  AppService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final int counter = 0;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const HomePage(),
    );
  }
}
