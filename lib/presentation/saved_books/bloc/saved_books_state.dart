part of 'saved_books_bloc.dart';

abstract class SavedBookState extends Equatable {
  const SavedBookState();

  @override
  List<Object?> get props => [];
}

class SavedBookInitial extends SavedBookState {}

class SavedBookLoading extends SavedBookState {}

class SavedBookLoaded extends SavedBookState {
  final List<SavedBookModel> books;
  final bool hasMore;

  const SavedBookLoaded(this.books, {this.hasMore = true});
}

class SavedBookAdded extends SavedBookState {
  final int saved;

  const SavedBookAdded(this.saved);
}

class SavedBookError extends SavedBookState {
  final String message;

  const SavedBookError(this.message);
}
