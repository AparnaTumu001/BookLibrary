import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/books_list_model.dart';
import '../../../domain/usecases/books_list_usecase.dart';

part 'books_list_event.dart';

part 'books_list_state.dart';

class BooksListBloc extends Bloc<BooksListEvent, BooksListState> {
  final GetBooksListUseCase booksListUseCase;

  String _currentQuery = '';
  int _currentOffset = 0;
  int _totalCount = 0;
  final int _pageSize = 20;
  List<DocsModel> _books = [];

  BooksListBloc(this.booksListUseCase) : super(BooksListInitial()) {
    on<GetBooksEvent>(_onLoadBooks);
    on<LoadMoreBooksEvent>(_onLoadMoreBooks);
  }

  Future<void> _onLoadBooks(
    GetBooksEvent event,
    Emitter<BooksListState> emit,
  ) async {
    emit(BooksListLoading());

    _currentQuery = event.param;
    _currentOffset = 0;
    _books.clear();

    final result = await booksListUseCase.call(
      BooksListParams(
        query: _currentQuery,
        limit: _pageSize.toString(),
        offset: _currentOffset.toString(),
      ),
    );

    result.fold((failure) => emit(BooksListError(failure.message)), (res) {
      _books = res.docs ?? [];
      _totalCount = res.numFound ?? 0;
      _currentOffset += _books.length;
      emit(BooksListLoaded(books: _books, totalCount: _totalCount));
    });
  }

  Future<void> _onLoadMoreBooks(
    LoadMoreBooksEvent event,
    Emitter<BooksListState> emit,
  ) async {
    if (_books.length >= _totalCount) return;

    emit(
      BooksListLoaded(
        books: _books,
        totalCount: _totalCount,
        isLoadingMore: true,
      ),
    );

    final result = await booksListUseCase.call(
      BooksListParams(
        query: _currentQuery,
        limit: _pageSize.toString(),
        offset: _currentOffset.toString(),
      ),
    );

    result.fold((failure) => emit(BooksListError(failure.message)), (res) {
      if (res.docs != null) {
        _books.addAll(res.docs!);
        _currentOffset = res.docs!.length;
      }
      emit(
        BooksListLoaded(
          books: _books,
          totalCount: _totalCount,
          isLoadingMore: false,
        ),
      );
    });
  }
}
