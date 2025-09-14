import 'package:bookfinder/core/app_strings.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const CustomSearchBar({super.key, required this.onSearch});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  void _onSearchSubmitted(String query) {
    FocusScope.of(context).unfocus();
    widget.onSearch(query);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: AppStrings.search_hint,
        hintStyle: TextStyle(fontStyle: FontStyle.italic),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_searchController.text.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  _searchController.clear();
                  setState(() {}); // refresh to hide clear icon
                },
              ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.deepPurple),
              splashRadius: 24,
              splashColor: Colors.deepPurple.withOpacity(0.3),
              highlightColor: Colors.deepPurple.withOpacity(0.1),
              onPressed: () => _onSearchSubmitted(_searchController.text),
            ),
          ],
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.deepPurpleAccent,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.deepPurpleAccent,
            width: 2.0,
          ),
        ),
      ),
      onSubmitted: (v) {
        FocusScope.of(context).unfocus();
        _onSearchSubmitted(v);
      },
    );
  }
}
