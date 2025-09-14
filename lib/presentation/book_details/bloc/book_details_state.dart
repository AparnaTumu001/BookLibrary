part of 'book_details_bloc.dart';

abstract class BookDetailsState extends Equatable {
  const BookDetailsState();

  @override
  List<Object?> get props => [];
}

class BookDetailsInitial extends BookDetailsState {}

class BookDetailsLoading extends BookDetailsState {}

class BookDetailsLoaded extends BookDetailsState {
  final BookDetailsModel bookDetailsModel;

  const BookDetailsLoaded(this.bookDetailsModel);

  @override
  List<Object?> get props => [bookDetailsModel];
}

class BookDetailsError extends BookDetailsState {
  final String message;

  const BookDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}

class SaveBookState extends BookDetailsState {
  final BookDetailsModel bookDetailsModel;

  const SaveBookState(this.bookDetailsModel);

  @override
  List<Object?> get props => [bookDetailsModel];
}
