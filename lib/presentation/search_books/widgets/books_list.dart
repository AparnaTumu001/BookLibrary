import 'package:bookfinder/core/common_widgets/common_list_widget.dart';
import 'package:bookfinder/presentation/search_books/bloc/books_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../core/app_strings.dart';
import '../../../core/common_widgets/custom_search_bar.dart';
import 'shimmer_book_list_item.dart';

class BooksList extends StatefulWidget {
  const BooksList({super.key});

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  final TextEditingController _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onSearchSubmitted(String query) {
    context.read<BooksListBloc>().add(GetBooksEvent(query, '0'));
  }

  void _onScroll() {
    print(_scrollController.position.pixels);
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<BooksListBloc>().add(LoadMoreBooksEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomSearchBar(
              onSearch: (String query) {
                _onSearchSubmitted(query);
              },
            ),
          ),
          Expanded(
            child: MultiBlocListener(
              listeners: [
                BlocListener<BooksListBloc, BooksListState>(
                  listener: (context, state) {
                    if (state is BooksListError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                ),
              ],
              child: BlocBuilder<BooksListBloc, BooksListState>(
                builder: (context, state) {
                  if (state is BooksListLoading) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: 10,
                      itemBuilder: (context, index) =>
                          const ShimmerBookListItem(),
                    );
                  } else if (state is BooksListLoaded) {
                    return RefreshIndicator(
                      onRefresh: () async =>
                          _onSearchSubmitted(_searchController.text),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AnimationLimiter(
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: state.books.length,
                            itemBuilder: (context, index) {
                              final book = state.books[index];
                              String imageUrl = getCoverUrl(
                                coverI: book.coverI,
                                editionKey: book.coverEditionKey,
                              );
                              print(imageUrl);
                              return CommonListWidget(
                                docsModel: state.books[index],
                                index: index,
                                imageUrl: imageUrl,
                                isFromSaved: false,
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  } else if (state is BooksListError) {
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

  String getCoverUrl({int? coverI, String? editionKey, String size = 'M'}) {
    if (editionKey != null && editionKey.isNotEmpty) {
      return '${AppStrings.COVERS_BASE_URL}b/olid/$editionKey-$size.jpg';
    } else if (coverI != null) {
      return '${AppStrings.COVERS_BASE_URL}b/id/$coverI-$size.jpg';
    } else {
      return '';
    }
  }
}
