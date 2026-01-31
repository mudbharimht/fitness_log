import 'package:commuter/Widget/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
  ThemeData myTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 192, 32, 66),
          brightness: Brightness.dark,
           dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
           contrastLevel: 0
        ), textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodySmall: GoogleFonts.raleway(fontSize: 18),
          bodyMedium: GoogleFonts.raleway(fontSize: 22),
          labelSmall: GoogleFonts.oswald(fontSize: 10),
          labelMedium: GoogleFonts.oswald(fontSize: 14),

          displaySmall: GoogleFonts.pacifico(),
        ),
        );

    return MaterialApp(
      title: "Fitlog V1.0",
      home: Homescreen(),
      theme: myTheme.copyWith(
        textTheme: myTheme.textTheme.copyWith(
          bodyMedium: myTheme.textTheme.bodyMedium!.copyWith(
            color:myTheme.colorScheme.onSecondaryContainer),
          bodySmall: myTheme.textTheme.bodySmall!.copyWith(
            color: myTheme.colorScheme.onPrimary)  
        ),
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor:myTheme.colorScheme.primaryContainer,
          selectedIconTheme: IconThemeData(
            color: myTheme.colorScheme.onSurfaceVariant,
          ),
          unselectedIconTheme: IconThemeData(
            color: myTheme.colorScheme.inversePrimary,
          ),
          unselectedLabelTextStyle: myTheme.textTheme.bodySmall,
          selectedLabelTextStyle: myTheme.textTheme.bodyMedium
        ),
        cardTheme:CardThemeData(color: myTheme.colorScheme.onTertiary)
      ),
    );
  }
}
