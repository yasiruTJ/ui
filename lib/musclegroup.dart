import 'package:flutter/material.dart';
import 'package:sdgp_ui/arms.dart';
import 'package:sdgp_ui/legs.dart';
import 'package:sdgp_ui/shoulders.dart';
import 'package:sdgp_ui/main.dart';

class Muscle extends StatelessWidget {

  Muscle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muscle Group'),
        centerTitle: false,
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            icon: Icon(
                Icons.person,
                color: Colors.white,
            ),
            onPressed:() async{
            },
            label: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white
                ),),
          ),
        ],
        foregroundColor: Colors.white,
      ),
        body: Center(
        child: Container(
        height: 1000,
        width: double.infinity,
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("images/back.jpg"),
        fit: BoxFit.cover),
          ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,50.0, 0.0, 0.0),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/legs.png'),
                radius: 50.0,
              ),
              const SizedBox(height: 5.0,),
              FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Legs()));
                },
                color: Colors.grey[900],
                child: const Text(
                  'LEGS',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/arms.png'),
                radius: 50.0,
              ),
              const SizedBox(height: 5.0,),
              FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Arms()));
                },
                color: Colors.grey[900],
                child: const Text(
                  'ARMS',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/shoulders.png'),
                radius: 50.0,
              ),
              const SizedBox(height: 5.0,),
              FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Shoulders()));
                },
                color: Colors.grey[900],
                child: const Text(
                  'SHOULDERS',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
         ),
        ),
      ),
    );
  }
}

