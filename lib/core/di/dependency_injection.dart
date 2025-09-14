import 'package:bookfinder/domain/usecases/saved_books_usecase.dart';
import 'package:bookfinder/presentation/book_details/bloc/book_details_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../data/data_sources/books_list_datasource.dart';
import '../../data/data_sources/saved_books_datasource.dart';
import '../../data/repositories/books_list_repository_impl.dart';
import '../../data/repositories/saved_books_repository_impl.dart';
import '../../domain/repositories/books_list_repository.dart';
import '../../domain/repositories/saved_books_repository.dart';
import '../../domain/usecases/books_list_usecase.dart';
import '../../presentation/saved_books/bloc/saved_books_bloc.dart';
import '../../presentation/search_books/bloc/books_list_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final database = await openDatabase(
    join(await getDatabasesPath(), "books.db"),
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE saved_books(
          id TEXT PRIMARY KEY,
          title TEXT,
          author TEXT,
          imageLink TEXT
        )
        ''');
    },
    version: 1,
  );

  sl.registerLazySingleton<Database>(() => database);

  // Bloc
  sl.registerFactory(() => BooksListBloc(sl()));
  sl.registerFactory(() => BookDetailsBloc(sl()));
  sl.registerFactory(
    () => SavedBookBloc(
      insertBookUseCase: sl(),
      getBooksUseCase: sl(),
    ),
  );

  // Use case
  sl.registerLazySingleton(() => GetBooksListUseCase(sl()));
  sl.registerLazySingleton(() => GetBookDetailsUseCase(sl()));
  sl.registerLazySingleton(() => InsertBookUseCase(sl()));
  sl.registerLazySingleton(() => GetBooksUseCase(sl()));

  // Repository
  sl.registerLazySingleton<BooksListRepository>(
    () => BooksListRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<BookDetailsRepository>(
    () => BookDetailsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<SavedBooksRepository>(
    () => SavedBooksRepositoryImpl(sl()),
  );

  // Data source
  sl.registerLazySingleton<BooksListDatasource>(
    () => BooksListDatasourceImpl(),
  );
  sl.registerLazySingleton<BookDetailsDatasource>(
    () => BookDetailsDatasourceImpl(),
  );
  sl.registerLazySingleton<SavedBookLocalDataSource>(
    () => SavedBookLocalDataSourceImpl(sl()),
  );
}
