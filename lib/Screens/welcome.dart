import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sdgp_ui/Screens/select_user.dart';

import 'navigation_drawer_widget.dart';


class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Welcome'),
          centerTitle: false,
          backgroundColor: Colors.grey[900],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed:()=> FirebaseAuth.instance.signOut(),
              label: const Text(
                'Logout',
                style: TextStyle(
                    color: Colors.white
                ),),
            ),
          ],
          foregroundColor: Colors.white,
    ),
        body: Container(
        height: 1000,
        width: double.infinity,
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("images/back.jpg"),
        fit: BoxFit.cover),
        ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,10.0, 0.0, 0.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Lottie.asset("lotties/wel.json"),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Welcome User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Select()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[900],
                      padding: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      )
                  ),
                  icon: const Icon(
                    Icons.person,
                    size: 32,
                    color: Colors.white,
                  ),
                  label : const Text(
                    "LET'S GET STARTED",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald',
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),
    );
  }
}
