import 'package:bookfinder/presentation/saved_books/bloc/saved_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import 'saved_books_list.dart';

class SavedBooksListPage extends StatelessWidget {
  const SavedBooksListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SavedBookBloc>(create: (_) => sl<SavedBookBloc>()),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Saved Books')),
        body: SavedBooksList(),
      ),
    );
  }
}
