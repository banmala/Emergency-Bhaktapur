import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:emergency_bhaktapur/Component/Button_Navigation_Bar.dart'
    as bnb;
import 'package:emergency_bhaktapur/Views/ContactList.dart';
import 'package:swipedetector/swipedetector.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return WillPopScope(
      onWillPop: () async {
        MoveToBackground.moveTaskToBack();
        return false;
      },
      child: SwipeDetector(
        onSwipeLeft: () {
          if (current_page < 4) {
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
                st: 'ambulance',
                appBar: 'Ambulance',
                appBarNepali: 'एम्बुलेन्स',
              ),
              ContactList(
                st: 'hospital',
                appBar: 'Hospital',
                appBarNepali: 'हस्पिटल',
              ),
              ContactList(
                st: 'fireBrigade',
                appBar: 'Fire Brigade',
                appBarNepali: 'दमकल',
              ),
              ContactList(
                st: 'police',
                appBar: 'Police',
                appBarNepali: 'प्रहरी',
              ),
              ContactList(
                st: 'sabbahan',
                appBar: 'Sab Bahan',
                appBarNepali: 'शवबाहन',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
