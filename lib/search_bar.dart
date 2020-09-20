import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchBar({
    Key key,
    @required this.onCancelSearch,
    @required this.controller,
    this.placeholderText = 'Search',
  }) : super(key: key);
  final TextEditingController controller;
  final VoidCallback onCancelSearch;
  final String placeholderText;
  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  void clearSearchQuery() {
    widget.controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildIconButton(),
                  Expanded(
                    child: buildTextField(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField() {
    return TextField(
      controller: widget.controller,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 20),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search, color: Colors.white),
        hintText: widget.placeholderText,
        hintStyle: TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          onPressed: clearSearchQuery,
          icon: Icon(Icons.close, color: Colors.white),
        ),
      ),
    );
  }

  IconButton buildIconButton() {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: widget.onCancelSearch,
    );
  }
}
