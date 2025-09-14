part of 'books_list_bloc.dart';


abstract class BooksListEvent extends Equatable {
  const BooksListEvent();

  @override
  List<Object?> get props => [];
}

class GetBooksEvent extends BooksListEvent {
  final String param;
  final String limit;

  const GetBooksEvent(this.param, this.limit);

  @override
  List<Object?> get props => [param,limit];
}

class LoadMoreBooksEvent extends BooksListEvent {}