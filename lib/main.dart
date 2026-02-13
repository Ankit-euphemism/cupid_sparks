import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'valentine_week_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valentine\'s Week',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const ValentineWeekScreen(),
    );
  }
}
// Center(child: Text("Hello To all lovers of Valentine's Day.")),