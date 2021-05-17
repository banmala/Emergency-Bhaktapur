import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}

class AboutDeveloper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Developers'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Column(
            children: <Widget>[
              DeveloperCard(
                name: "Bikesh Sitikhu",
                college: "KhCE",
                email: "sitikhubikesh@gmail.com",
                phone: '9860117649',
                image: "assets/images/developers/bikesh.jpg",
                university: "https://khwopa.edu.np/",
              ),
              DeveloperCard(
                name: "Luja Shakya",
                college: "KhCE",
                phone: '9860685929',
                email: "shakyaluja445@gmail.com",
                image: "assets/images/developers/luja.jpg",
                university: "https://khwopa.edu.np/",
              ),
              DeveloperCard(
                name: "Niranjan Bekoju",
                college: "KhCE",
                phone: '9843803828',
                email: "bekojuniranjan@gmail.com",
                image: "assets/images/developers/niranjan.jpg",
                university: "https://khwopa.edu.np/",
              ),
              DeveloperCard(
                name: "Sunil Banmala",
                college: "KhCE",
                phone: '9840521409',
                email: "sunilbanmala0@gmail.com",
                image: "assets/images/developers/sunil.jpg",
                university: "https://khwopa.edu.np/",
              ),
              DeveloperCard(
                name: "Nhuja Kiju",
                college: "BMC",
                phone: '9843578712',
                email: "nhuj.kiju@gmail.com",
                image: "assets/images/developers/nhuza.jpg",
                university: "http://bmcbkt.edu.np/",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeveloperCard extends StatelessWidget {
  DeveloperCard(
      {Key key, this.name, this.college, this.email, this.phone, this.image,this.university})
      : super(key: key);
  String name, crn, image, college, email, phone,university;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width * 0.62,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          this.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Divider(),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.university),
                              onPressed: () {
                                _launchInBrowser(this.university);
                              }),
                          Text(
                            this.college,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.envelope),
                              onPressed: () {
                                launch("mailto:" + this.email);
                              }),
                          Text(
                            this.email,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.phone),
                              onPressed: () {
                                _makePhoneCall('tel:' + this.phone);
                              }),
                          Text(
                            this.phone,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  margin: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset.fromDirection(90, 3),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(this.image),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
