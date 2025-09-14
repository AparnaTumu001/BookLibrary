import 'package:bookfinder/presentation/saved_books/widgets/saved_books_list_page.dart';
import 'package:bookfinder/presentation/search_books/widgets/books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../bloc/books_list_bloc.dart';

class BooksListPage extends StatefulWidget {
  const BooksListPage({super.key});

  @override
  State<BooksListPage> createState() => _BooksListPageState();
}

class _BooksListPageState extends State<BooksListPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BooksListBloc>(create: (_) => sl<BooksListBloc>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book Library'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SavedBooksListPage()),
                );
              },
              icon: Icon(Icons.bookmark_added),
            ),
          ],
        ),
        body: BooksList(),
      ),
    );
  }
}
