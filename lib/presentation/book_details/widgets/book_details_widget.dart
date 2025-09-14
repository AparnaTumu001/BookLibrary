import 'package:bookfinder/core/app_strings.dart';
import 'package:bookfinder/core/common_widgets/rotating_disc_image.dart';
import 'package:bookfinder/domain/entities/saved_books_model.dart';
import 'package:bookfinder/presentation/book_details/bloc/book_details_bloc.dart';
import 'package:bookfinder/presentation/saved_books/bloc/saved_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import '../../../domain/entities/books_list_model.dart';
import 'shimmer_book_details.dart';

class BookDetailsWidget extends StatefulWidget {
  final DocsModel book;
  final String imageUrl;

  const BookDetailsWidget({
    super.key,
    required this.book,
    required this.imageUrl,
  });

  @override
  State<BookDetailsWidget> createState() => _BookDetailsWidgetState();
}

class _BookDetailsWidgetState extends State<BookDetailsWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookDetailsBloc>().add(
        GetBookDetailsEvent(widget.book.key ?? ""),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Info'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_sharp),
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<BookDetailsBloc, BookDetailsState>(
            listener: (context, state) {
              if (state is BookDetailsError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is SaveBookState || state is BookDetailsLoaded) {
                setState(() {});
              }
            },
          ),
          BlocListener<SavedBookBloc, SavedBookState>(
            listener: (context, state) {
              if (state is SavedBookError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is SavedBookAdded) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Saved Successfully.')));
              }
            },
          ),
        ],
        child: BlocBuilder<BookDetailsBloc, BookDetailsState>(
          builder: (context, state) {
            if (state is BookDetailsLoading) {
              return BookDetailsShimmer();
            } else if (state is BookDetailsLoaded) {
              return displayUI(state);
            } else if (state is SaveBookState) {
              return displayUI(state);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget displayUI(state) {
    String description = AppStrings.no_description_available;
    if (state.bookDetailsModel.description != null) {
      if (state.bookDetailsModel.description is Map<String, dynamic>?) {
        description = state.bookDetailsModel.description['value'];
      } else if (state.bookDetailsModel.description is String?) {
        description = state.bookDetailsModel.description;
      }
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Card(
                  clipBehavior: Clip.hardEdge,
                  color: Colors.purple[50],
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Hero(
                            tag:
                                "book_${widget.book.coverEditionKey ?? widget.book.coverI}",
                            child: RotatingDisc(imageUrl: widget.imageUrl),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                widget.book.title ?? "",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person,
                              size: 25,
                              color: Colors.black54,
                            ),
                            Expanded(
                              child: Text(
                                widget.book.authorName?.join(", ") ?? "Unknown",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: Colors.deepPurpleAccent.shade100,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ReadMoreText(
                              description,
                              trimMode: TrimMode.Line,
                              trimLines: 3,
                              colorClickableText: Colors.deepPurpleAccent,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              moreStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Highlights",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        if (state.bookDetailsModel.subjects != null) ...[
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 5,
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      state.bookDetailsModel.subjects![index],
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount:
                                state.bookDetailsModel.subjects?.length ?? 0,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 5),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: IconButton(
                    icon: Icon(
                      Icons.bookmark_add_outlined,
                      color: Colors.deepPurple,
                      size: 28,
                    ),
                    onPressed: () {
                      context.read<SavedBookBloc>().add(
                        AddBookEvent(
                          SavedBookModel(
                            id: widget.book.key,
                            title: widget.book.title ?? "",
                            authorName:
                                widget.book.authorName?.join(", ") ?? "Unknown",
                            imageLink: widget.imageUrl,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
