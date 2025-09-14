import 'package:bookfinder/domain/entities/books_list_model.dart';
import 'package:bookfinder/presentation/saved_books/bloc/saved_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/app_strings.dart';
import '../../../core/common_widgets/common_list_widget.dart';
import '../../search_books/widgets/shimmer_book_list_item.dart';

class SavedBooksList extends StatefulWidget {
  const SavedBooksList({super.key});

  @override
  State<SavedBooksList> createState() => _SavedBooksListState();
}

class _SavedBooksListState extends State<SavedBooksList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SavedBookBloc>().add(LoadSavedBooksEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: MultiBlocListener(
              listeners: [
                BlocListener<SavedBookBloc, SavedBookState>(
                  listener: (context, state) {
                    if (state is SavedBookError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                ),
              ],
              child: BlocBuilder<SavedBookBloc, SavedBookState>(
                builder: (context, state) {
                  if (state is SavedBookLoading) {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) =>
                          const ShimmerBookListItem(),
                    );
                  } else if (state is SavedBookLoaded) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: AnimationLimiter(
                        child: ListView.builder(
                          itemCount: state.books.length,
                          itemBuilder: (context, index) {
                            final book = state.books[index];
                            return CommonListWidget(
                              docsModel: DocsModel(
                                authorName: [book.authorName],
                                title: book.title,
                              ),
                              index: index,
                              imageUrl: book.imageLink,
                              isFromSaved: true,
                            );
                          },
                        ),
                      ),
                    );
                  } else if (state is SavedBookError) {
                    return const Center(child: Text(AppStrings.no_data));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
