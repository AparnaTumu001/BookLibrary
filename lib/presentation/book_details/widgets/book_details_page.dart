import 'package:bookfinder/domain/entities/books_list_model.dart';
import 'package:bookfinder/presentation/book_details/bloc/book_details_bloc.dart';
import 'package:bookfinder/presentation/book_details/widgets/book_details_widget.dart';
import 'package:bookfinder/presentation/saved_books/bloc/saved_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';

class BookDetailsPage extends StatelessWidget {
  final DocsModel book;
  final String imageUrl;

  const BookDetailsPage({
    super.key,
    required this.book,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookDetailsBloc>(create: (_) => sl<BookDetailsBloc>()),
        BlocProvider<SavedBookBloc>(create: (_) => sl<SavedBookBloc>()),
      ],
      child: BookDetailsWidget(book: book, imageUrl: imageUrl),
    );
  }
}
