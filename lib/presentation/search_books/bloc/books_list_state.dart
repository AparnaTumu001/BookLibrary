part of 'books_list_bloc.dart';

abstract class BooksListState {}

class BooksListInitial extends BooksListState {}

class BooksListLoading extends BooksListState {}

class BooksListLoaded extends BooksListState {
  final List<DocsModel> books;
  final int totalCount;
  final bool isLoadingMore;

  BooksListLoaded({
    required this.books,
    required this.totalCount,
    this.isLoadingMore = false,
  });
}

class BooksListError extends BooksListState {
  final String message;

  BooksListError(this.message);
}
