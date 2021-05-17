import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    Key key,
    @required GlobalKey<State<StatefulWidget>> bottomNavigationKey,
    @required PageController pageController,
  })  : _bottomNavigationKey = bottomNavigationKey,
        _pageController = pageController,
        super(key: key);

  final GlobalKey<State<StatefulWidget>> _bottomNavigationKey;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return CurvedNavigationBar(
      index: 0,
      key: _bottomNavigationKey,
      height: _size.height > 650 ? 55.0 : 45.0,
      backgroundColor: Colors.white,
      color: Colors.red,
      buttonBackgroundColor: Colors.red,
      animationCurve: Curves.linearToEaseOut,
      animationDuration: Duration(milliseconds: 500),
      onTap: (index) {
        _pageController.jumpToPage(index);
      },
      items: <Widget>[
        Icon(FontAwesome.ambulance,
            size: _size.height > 650 ? 30 : 25, color: Colors.white),
        Icon(Icons.local_hospital,
            size: _size.height > 650 ? 30 : 25, color: Colors.white),
        Icon(FontAwesome.shower,
            size: _size.height > 650 ? 30 : 25, color: Colors.white),
        Icon(FontAwesome.star,
            size: _size.height > 650 ? 30 : 25, color: Colors.white),
        Icon(FontAwesome.warning,
            size: _size.height > 650 ? 30 : 25, color: Colors.white),
      ],
    );
  }
}
