import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 61, 103, 255);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      // Color Primario
      primaryColor: primary,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: IconThemeData(
          color: primary,
        ),
      ),

      // TextButton Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primary),
      ),

      // FloatingActionsBottons
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
      ),

      // ElevationButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: primary,
          shape: const StadiumBorder(),
          elevation: 10,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle:
            TextStyle(color: primary, fontWeight: FontWeight.w800),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(195, 158, 158, 158),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primary,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      // Color Primario
      primaryColor: primary,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        color: primary,
        elevation: 0,
      ),

      // Scaffold
      scaffoldBackgroundColor: Colors.black);

  // Temas por separado
  static const TextStyle titleScreen = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleOptionHomeMenu = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w800,
  );

   static final BoxDecoration optionMenuDecoration = BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        offset: Offset(0, 4),
        blurRadius: 5,
      ),
    ],
  );
}
