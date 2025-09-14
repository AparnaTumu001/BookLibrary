import 'package:bookfinder/domain/entities/books_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../presentation/book_details/widgets/book_details_page.dart';
import 'common_cached_network_image.dart';

class CommonListWidget extends StatelessWidget {
  CommonListWidget({
    this.docsModel,
    this.index,
    this.imageUrl,
    required this.isFromSaved,
  });

  DocsModel? docsModel;
  int? index;
  String? imageUrl;
  bool? isFromSaved = false;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index ?? 0,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        verticalOffset: 50.0,
        curve: Curves.easeOut,
        child: FadeInAnimation(
          child: GestureDetector(
            onTap: !isFromSaved!
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookDetailsPage(
                          book: docsModel!,
                          imageUrl: imageUrl ?? '',
                        ),
                      ),
                    );
                  }
                : null,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    thumbNail(imageUrl ?? ''),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            docsModel!.title ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(docsModel!.authorName?.join(" ") ?? ""),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
