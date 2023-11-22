import 'package:cupid_match/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class MyTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.outfit().fontFamily,
    primarySwatch: Colors.pink,
    primaryColor: Color(0xffFE0091),

    // fontFamily: GoogleFonts.outfit().fontFamily,
    scaffoldBackgroundColor:Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,

        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xffCACACA),
          // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark,
          //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
          Brightness.dark, //<-- For iOS SEE HERE (dark icons)
        ),
        iconTheme: IconThemeData(color: AppColors.black),
        actionsIconTheme: IconThemeData(color: AppColors.black),
        titleTextStyle: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500),
        elevation: 0),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // foregroundColor: AppColors.black,
        backgroundColor: Color(0xffFE008F),
        textStyle: GoogleFonts.outfit(
            fontSize: 20.0,
            color: AppColors.white,
            fontWeight: FontWeight.w700),
        minimumSize: const Size(145, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.outfit(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      displayLarge: GoogleFonts.inter(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
      displayMedium: GoogleFonts.inter(
          fontSize: 22, color: Colors.black, fontWeight: FontWeight.w700),
      displaySmall: GoogleFonts.inter(
          fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700),
      headlineMedium: GoogleFonts.inter(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
      headlineSmall: GoogleFonts.inter(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
      titleLarge: GoogleFonts.inter(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
      labelMedium: GoogleFonts.inter(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.inter(fontSize: 16, color: Colors.black),
      titleSmall: GoogleFonts.inter(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
      bodyLarge: GoogleFonts.inter(
          fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.inter(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
      bodySmall: GoogleFonts.inter(
          fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
      labelLarge: GoogleFonts.inter(fontSize: 12, color: Colors.white),
      labelSmall: GoogleFonts.inter(fontSize: 10, color: Colors.black),
    ),
  );
}