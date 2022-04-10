import 'package:flutter/material.dart';
import 'package:sdgp_ui/musclegroup.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed:(){},
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
            padding: const EdgeInsets.fromLTRB(0.0,100.0, 0.0, 0.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/welcome.png'),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Welcome User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 50.0),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Muscle()));
                  },
                  color: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Text(
                    'LETS GET STARTED',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald',
                      letterSpacing: 2.0,
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
