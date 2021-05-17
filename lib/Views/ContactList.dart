import 'dart:convert';
import 'package:emergency_bhaktapur/Process/Storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:emergency_bhaktapur/Component/Custom_Drawer.dart';
import 'package:emergency_bhaktapur/Component/ContactCard.dart';
import 'package:emergency_bhaktapur/globals.dart' as globals;

class ContactList extends StatefulWidget {
  ContactList(
      {Key key, this.st, this.appBar, this.appBarNepali, this.isDrawer = true})
      : super(key: key);
  String st, appBar, appBarNepali;
  bool isDrawer;
  @override
  _ContactListState createState() => _ContactListState(
      st: this.st,
      appBar: this.appBar,
      appBarNepali: this.appBarNepali,
      isDrawer: this.isDrawer);
}

class _ContactListState extends State<ContactList> {
  _ContactListState(
      {Key key, this.st, this.appBar, this.appBarNepali, this.isDrawer});
  String st, appBar, appBarNepali;
  bool isDrawer;

  Storage storage;
  FSBStatus drawerStatus;
  int length = 0;
  List jsonFire;

  bool isNep;

  void getData() async {
    storage = new Storage(this.st);
    storage.readData().then((String value) {
      setState(() {
        this.jsonFire = jsonDecode(value);
        this.length = jsonFire.length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    isNep = globals.isNepali;
  }

  void toggleLanguage() {
    setState(() {
      isNep = !isNep;
      globals.isNepali = isNep;
    });
  }

  void madeNepali() {
    setState(() {
      isNep = true;
      globals.isNepali = isNep;
    });
  }

  void madeEnglish() {
    setState(() {
      isNep = false;
      globals.isNepali = isNep;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            height: 30,
            child: this.isNep ? Text(this.appBarNepali) : Text(this.appBar)),
        actions: <Widget>[
          Container(
            height: 30,
            padding: EdgeInsets.only(top: 15, left: 5),
            child: InkWell(
              onTap: madeEnglish,
              child: Text(
                '🇺🇸',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: toggleLanguage,
            child: AnimatedContainer(
              height: 40,
              width: 100,
              duration: Duration(
                milliseconds: 500,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.white70,
                  border: Border.all(
                    color: Colors.red,
                    width: 8,
                  )),
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    child: InkWell(
                      onTap: toggleLanguage,
                      child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: this.isNep
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.red,
                                  size: 35,
                                  key: UniqueKey(),
                                )
                              : Icon(
                                  Icons.check_circle,
                                  color: Colors.red,
                                  size: 35,
                                  key: UniqueKey(),
                                )),
                    ),
                    duration: Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.easeIn,
                    top: 3,
                    left: this.isNep ? 45 : 5,
                    right: this.isNep ? 20 : 60,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            padding: EdgeInsets.only(top: 15, left: 5),
            child: InkWell(
              onTap: madeNepali,
              child: Text(
                '🇳🇵',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ],
        leading: this.isDrawer
            ? IconButton(
                icon: Icon(
                  MaterialCommunityIcons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                        ? FSBStatus.FSB_CLOSE
                        : FSBStatus.FSB_OPEN;
                  });
                })
            : IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 34,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
        automaticallyImplyLeading: false,
      ),
      body: FoldableSidebarBuilder(
        drawerBackgroundColor: Colors.white,
        status: drawerStatus,
        drawer: CustomDrawer(
          closeDrawer: () {
            setState(() {
              drawerStatus = FSBStatus.FSB_CLOSE;
            });
          },
        ),
        screenContents: Container(
          child: ListView.builder(
            itemCount: this.length,
            itemBuilder: (BuildContext context, int index) {
              if (this.length != 0) {
                if ((this.jsonFire[index]['contact'] != "" &&
                    this.jsonFire[index]['contact'] != null)) {
                  if ((this.jsonFire[index]['title'] != "" &&
                      this.jsonFire[index]['title'] != null)) {
                    return ContactCard(
                      title: this.jsonFire[index]['title'],
                      title_nep: this.jsonFire[index]['title_nep'],
                      contact: this.jsonFire[index]['contact'],
                      contact_nep: this.jsonFire[index]['contact_nep'],
                    );
                  }
                } else {
                  if ((this.jsonFire[index]['title'] != "" &&
                      this.jsonFire[index]['title'] != null)) {
                    return Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        this.isNep
                            ? this.jsonFire[index]['title_nep']
                            : this.jsonFire[index]['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
