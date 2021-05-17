import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:emergency_bhaktapur/Component/Municipality_Button_Navigation_Bar.dart'
    as bnb;
import 'package:emergency_bhaktapur/Views/ContactList.dart';

class Municipality extends StatefulWidget {
  @override
  _MunicipalityState createState() => _MunicipalityState();
}

class _MunicipalityState extends State<Municipality> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  PageController _pageController;
  int current_page = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      onSwipeLeft: () {
        if (current_page < 3) {
          current_page++;
        }
        _pageController.jumpToPage(current_page);
      },
      onSwipeRight: () {
        if (current_page > 0) {
          current_page--;
        }
        _pageController.jumpToPage(current_page);
      },
      swipeConfiguration:
          SwipeConfiguration(horizontalSwipeMinDisplacement: 75),
      child: Scaffold(
        bottomNavigationBar: bnb.BottomNavigationBar(
          bottomNavigationKey: _bottomNavigationKey,
          pageController: _pageController,
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            current_page = index;
            final CurvedNavigationBarState navBarState =
                _bottomNavigationKey.currentState;
            navBarState.setPage(index);
          },
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ContactList(
              st: 'bhaktapur',
              appBar: 'Bhaktapur',
              appBarNepali: 'भक्तपुर',
              isDrawer: false,
            ),
            ContactList(
              st: 'changu',
              appBar: 'Changu Narayan',
              appBarNepali: 'चाँगुनारायण',
              isDrawer: false,
            ),
            ContactList(
              st: 'thimi',
              appBar: 'Madhayapur Thimi',
              appBarNepali: 'मध्यपुर ठिमी',
              isDrawer: false,
            ),
            ContactList(
              st: 'suryabinayak',
              appBar: 'Surya Binayak',
              appBarNepali: 'सुर्यविनायक',
              isDrawer: false,
            ),
          ],
        ),
      ),
    );
  }
}
