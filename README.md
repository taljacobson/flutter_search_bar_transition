# reveal_search_bar 
simple appbar transition to appbar with textField

![Flutter Web](https://github.com/taljacobson/flutter_search_bar_transition/workflows/Flutter%20Web/badge.svg)
[![pub package](https://img.shields.io/pub/v/reveal_search_bar.svg)](https://pub.dartlang.org/packages/reveal_search_bar)

example https://taljacobson.github.io/flutter_search_bar_transition/#/


based off [NishantDesai1306/flutter_search_bar_transition](https://github.com/NishantDesai1306/flutter_search_bar_transition)


most of the properties are the same as with `AppBar` except for the addition of 

```dart
  
  /// callback for when closing
  final VoidCallback onCancelSearch;
  /// search Seach icon container overide
  final Widget searchIconContainer;
  /// text controller -- required
  final TextEditingController searchController;
  /// reveal color -- defaults to `theme.of(context).accentColor`
  final Color revealColor;
  /// duration for transition -- defaults to `Duration(milliseconds: 300)`
  final Duration duration;

  ```