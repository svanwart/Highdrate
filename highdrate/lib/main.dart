import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/home_page.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  final ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: Colors.blue,);
  runApp(MaterialApp(
    title: 'Highdrate',
    theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme,
          textTheme: Typography.blackMountainView,
          appBarTheme: AppBarTheme(
            backgroundColor: colorScheme.primaryContainer,
            foregroundColor: colorScheme.primary
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primaryContainer,
                foregroundColor: colorScheme.primary)),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: colorScheme.primaryContainer,
            foregroundColor: colorScheme.primary
          ),
          iconTheme: IconThemeData(color: colorScheme.primary),
    ),
    home: HomePage(),
  ));
}

