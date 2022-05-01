import 'package:flutter/material.dart';
import 'package:sdgp_ui/Navigation/aboutus.dart';
import 'package:sdgp_ui/Navigation/contactus.dart';
import 'package:sdgp_ui/Navigation/faqs.dart';
import 'package:sdgp_ui/Navigation/newsletter.dart';
import 'package:sdgp_ui/Screens/splash.dart';

import '../Navigation/help.dart';
import 'onboard.dart';

class NavigationDrawerWidget extends StatelessWidget {

  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.black,
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(height: 48,),
            buildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context,0),
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'FAQs',
              icon: Icons.question_answer_rounded,
              onClicked: () => selectedItem(context,1),
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Newsletter',
              icon: Icons.mail,
              onClicked: () => selectedItem(context,2),
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'About Us',
              icon: Icons.info_sharp,
              onClicked: () => selectedItem(context,3),
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Contact Us',
              icon: Icons.phone,
              onClicked: () => selectedItem(context,4),
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Help',
              icon: Icons.help,
              onClicked: () => selectedItem(context,5),
            ),
          ],
        ),
      ),
    );
  }

  buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color,),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {

    switch(index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Splash()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => faqs()));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => newsLetter()));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => aboutUs()));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => contactUs()));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => help()));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnBoardingScreen()));
        break;
    }
  }

}
