import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_details_model.dart';
import '../../../domain/usecases/books_list_usecase.dart';

part 'book_details_event.dart';

part 'book_details_state.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  GetBookDetailsUseCase bookDetailsUseCase;

  BookDetailsBloc(this.bookDetailsUseCase) : super(BookDetailsInitial()) {
    on<BookDetailsEvent>((event, emit) async {
      try {
        if (event is GetBookDetailsEvent) {
          emit(BookDetailsLoading());
          await _onLoadBookDetails(event, emit);
        } else if (event is SaveBookEvent) {
          emit(SaveBookState(event.bookDetailsModel));
        }
      } catch (e) {
        emit(BookDetailsError(e.toString()));
      }
    });
  }

  Future<void> _onLoadBookDetails(
    GetBookDetailsEvent event,
    Emitter<BookDetailsState> emit,
  ) async {
    emit(BookDetailsLoading());

    final result = await bookDetailsUseCase.call(event.param);

    return result.fold(
      (failure) => emit(BookDetailsError(failure.message)),
      (books) => emit(BookDetailsLoaded(books)),
    );
  }
}
