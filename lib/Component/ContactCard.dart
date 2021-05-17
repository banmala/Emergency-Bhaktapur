import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:emergency_bhaktapur/globals.dart' as globals;

class ContactCard extends StatelessWidget {
  ContactCard(
      {Key key, this.title, this.title_nep, this.contact, this.contact_nep})
      : super(key: key);
  String title, title_nep, contact, contact_nep;
  String titleString, contactString;
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (globals.isNepali) {
      this.titleString = this.title_nep;
      this.contactString = this.contact_nep;
    } else {
      this.titleString = this.title;
      this.contactString = this.contact;
    }
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: 55,
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset.fromDirection(90, 3),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            this.titleString,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            this.contactString,
            style: TextStyle(fontSize: 16),
          ),
          trailing: Icon(
            FontAwesomeIcons.phone,
            color: Colors.green,
          ),
          onTap: () {
            print('Contact ');
            _makePhoneCall('tel:' + this.contact);
          },
        ),
      ),
    );
  }
}
