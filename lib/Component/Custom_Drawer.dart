import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:emergency_bhaktapur/Views/AboutDeveloper.dart';
import 'package:emergency_bhaktapur/Views/Policy.dart';
import 'package:emergency_bhaktapur/Views/Municipality.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:emergency_bhaktapur/Views/ContactList.dart';
import 'package:emergency_bhaktapur/globals.dart' as globals;

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;
  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).cardColor,
        width: mediaQuery.size.width * 0.60,
        height: mediaQuery.size.height,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                closeDrawer();
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/ambulance.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(color: Colors.black38),
                  )
                ],
              ),
            ),
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Municipality()));
                },
                leading: Icon(
                  Icons.location_city,
                  color: Colors.blue[700],
                ),
                title: globals.isNepali
                    ? Text("नगरपालिका")
                    : Text("Municipalties")),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactList(
                              st: 'covid',
                              appBar: 'Covid 19',
                              appBarNepali: 'कोभिड-१९',
                              isDrawer: false,
                            )));
              },
              leading: Icon(
                FontAwesomeIcons.virus,
                color: Colors.blue[700],
              ),
              title: globals.isNepali ? Text("कोभिड-१९") : Text("Covid 19"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactList(
                              st: 'office',
                              appBar: 'Government Office',
                              appBarNepali: 'सरकारी कार्यालय',
                              isDrawer: false,
                            )));
              },
              leading: Icon(
                FontAwesomeIcons.building,
                color: Colors.blue[700],
              ),
              title: globals.isNepali
                  ? Text("सरकारी कार्यालय")
                  : Text("Government Office"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactList(
                              st: 'blood',
                              appBar: 'Blood Banks',
                              appBarNepali: 'ब्लड बैंक',
                              isDrawer: false,
                            )));
              },
              leading: Icon(
                FontAwesomeIcons.handHoldingWater,
                color: Colors.blue[700],
              ),
              title: globals.isNepali ? Text("ब्लड बैंक") : Text("Blood Banks"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutDeveloper()));
              },
              leading: Icon(
                Icons.code,
                color: Colors.blue[700],
              ),
              title: globals.isNepali
                  ? Text("विकासकर्ता टोली")
                  : Text("Developers Team"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Policy()));
              },
              leading: Icon(
                Icons.pages,
                color: Colors.blue[700],
              ),
              title: globals.isNepali
                  ? Text("गोपनीयता नीति")
                  : Text("Privacy Policy"),
            ),
            ListTile(
              onTap: () {
                SystemNavigator.pop();
              },
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.blue[800],
              ),
              title:
                  globals.isNepali ? Text("बाहिर निस्कनुहोस्") : Text("Exit"),
            ),
          ],
        ),
      ),
    );
  }
}
