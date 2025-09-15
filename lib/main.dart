import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart' as di;
import 'presentation/search_books/widgets/books_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData theme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepPurple,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
    // Add more theme properties as needed (e.g., textTheme, colorScheme, etc.)
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Finder',
      theme: theme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const BooksListPage(),
    );
  }
}
