import 'package:flutter/material.dart';
import 'package:RevealSearchBar/my_painter.dart';
import 'package:RevealSearchBar/search_bar.dart';

class RevealAppBar extends StatefulWidget implements PreferredSizeWidget {
  const RevealAppBar({
    Key key,
    @required this.searchController,
    this.onCancelSearch,
    this.searchIconContainer,
    this.title,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions = const <Widget>[],
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.shape,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.revealColor,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  final VoidCallback onCancelSearch;
  final Widget searchIconContainer;
  final TextEditingController searchController;

  final Widget title;
  final Widget leading;
  final bool automaticallyImplyLeading;
  final List<Widget> actions;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final double elevation;
  final ShapeBorder shape;
  final Color backgroundColor;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final IconThemeData actionsIconTheme;
  final TextTheme textTheme;
  final bool primary;
  final bool centerTitle;
  final double titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final Color revealColor;
  final Duration duration;
  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  _RevealAppBarState createState() => _RevealAppBarState();
}

class _RevealAppBarState extends State<RevealAppBar>
    with SingleTickerProviderStateMixin {
  double rippleStartX, rippleStartY;
  AnimationController _controller;
  Animation<double> _animation;
  bool isInSearchMode = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addStatusListener(animationStatusListener);
  }

  void animationStatusListener(AnimationStatus animationStatus) {
    if (animationStatus == AnimationStatus.completed) {
      setState(() {
        isInSearchMode = true;
      });
    }
  }

  void onSearchTapUp(TapUpDetails details) {
    setState(() {
      rippleStartX = details.globalPosition.dx;
      rippleStartY = details.globalPosition.dy;
    });
    _controller.forward();
  }

  void cancelSearch() {
    setState(() {
      isInSearchMode = false;
    });
    if (widget.onCancelSearch != null) {
      widget.onCancelSearch();
    } else {
      widget.searchController.clear();
    }
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    var searchIconContainer = Container(
      width: 48,
      height: 48,
      child: Center(
        child: Icon(
          Icons.search,
        ),
      ),
    );

    final actions = <Widget>[
      GestureDetector(
        child: widget.searchIconContainer ?? searchIconContainer,
        onTapUp: onSearchTapUp,
      ),
      ...widget.actions,
    ]..toList();

    final appBar = AppBar(
      title: widget.title,
      actions: actions,
      backgroundColor: widget.backgroundColor,
      actionsIconTheme: widget.actionsIconTheme,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      bottom: widget.bottom,
      bottomOpacity: widget.bottomOpacity,
      brightness: widget.brightness,
      centerTitle: widget.centerTitle,
      elevation: widget.elevation,
      flexibleSpace: widget.flexibleSpace,
      iconTheme: widget.iconTheme,
      leading: widget.leading,
      primary: widget.primary,
      shape: widget.shape,
      textTheme: widget.textTheme,
      titleSpacing: widget.titleSpacing,
      toolbarOpacity: widget.toolbarOpacity,
    );

    final searchWidget = isInSearchMode
        ? SearchBar(
            onCancelSearch: cancelSearch, controller: widget.searchController)
        : Container();

    return Stack(
      children: <Widget>[
        appBar,
        AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget child) {
            return CustomPaint(
              painter: MyPainter(
                containerHeight: widget.preferredSize.height,
                center: Offset(rippleStartX ?? 0, rippleStartY ?? 0),
                radius: _animation.value * screenWidth,
                context: context,
                color: widget.revealColor ?? Theme.of(context).accentColor,
              ),
            );
          },
        ),
        searchWidget
      ],
    );
  }
}
