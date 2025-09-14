import 'package:bookfinder/domain/entities/saved_books_model.dart';
import 'package:bookfinder/domain/usecases/books_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/saved_books_usecase.dart';

part 'saved_books_event.dart';

part 'saved_books_state.dart';

class SavedBookBloc extends Bloc<SavedBookEvent, SavedBookState> {
  final GetBooksUseCase? getBooksUseCase;
  final InsertBookUseCase? insertBookUseCase;

  SavedBookBloc({
    this.getBooksUseCase,
    this.insertBookUseCase,
  }) : super(SavedBookInitial()) {
    on<LoadSavedBooksEvent>((event, emit) async {
      emit(SavedBookLoading());

      final result = await getBooksUseCase?.call(
        BooksListParams(query: "", limit: '20', offset: ''),
      );
      return result?.fold(
        (failure) => emit(SavedBookError(failure.message)),
        (books) => emit(SavedBookLoaded(books)),
      );
    });

    on<AddBookEvent>((event, emit) async {
      emit(SavedBookLoading());
      var result = await insertBookUseCase?.call(event.book);

      return result?.fold(
        (failure) => emit(SavedBookError(failure.message)),
        (books) => emit(SavedBookAdded(books)),
      );
    });
  }
}
