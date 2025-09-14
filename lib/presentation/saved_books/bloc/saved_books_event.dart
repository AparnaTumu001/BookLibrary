part of 'saved_books_bloc.dart';

abstract class SavedBookEvent extends Equatable {
  const SavedBookEvent();

  @override
  List<Object?> get props => [];
}

class LoadSavedBooksEvent extends SavedBookEvent {
  const LoadSavedBooksEvent();
}

class AddBookEvent extends SavedBookEvent {
  final SavedBookModel book;

  const AddBookEvent(this.book);
}
