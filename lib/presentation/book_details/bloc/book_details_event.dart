part of 'book_details_bloc.dart';

abstract class BookDetailsEvent extends Equatable {
  const BookDetailsEvent();

  @override
  List<Object?> get props => [];
}

class GetBookDetailsEvent extends BookDetailsEvent {
  final String param;

  const GetBookDetailsEvent(this.param);

  @override
  List<Object?> get props => [param];
}

class SaveBookEvent extends BookDetailsEvent {
  final BookDetailsModel bookDetailsModel;

  const SaveBookEvent(this.bookDetailsModel);

  @override
  List<Object?> get props => [this.bookDetailsModel];
}
