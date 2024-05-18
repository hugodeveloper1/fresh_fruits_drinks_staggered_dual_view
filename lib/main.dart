import 'package:flutter/material.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/controllers/home_controller.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/views/home_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: GoogleFonts.karla(
              color: const Color(0xFF6C6C6C),
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          primaryColor: const Color(0xFFFF9502),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          cardTheme: CardTheme(
            margin: EdgeInsets.zero,
            shadowColor: Colors.black26,
            elevation: 6,
            surfaceTintColor: Colors.white,
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: GoogleFonts.karla(
              color: const Color(0xFFABABAB),
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        home: const HomeView(),
      ),
    );
  }
}
