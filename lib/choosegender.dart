import 'package:flutter/material.dart';
import 'package:sdgp_ui/female.dart';
import 'package:sdgp_ui/male.dart';

void main() => runApp(MaterialApp(
  home: ChooseGender(),
  routes: {
    '/male' : (context) => Male(),
    '/female' : (context) => Female(),
  },
));

class ChooseGender extends StatelessWidget {
  const ChooseGender({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
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
          padding: const EdgeInsets.fromLTRB(0.0,150.0, 0.0, 0.0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                    Text(
                      'Choose Your Gender',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 5.0,
                        fontFamily: 'Serif',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/female.png'),
                      radius: 60.0,
                    ),
                    SizedBox(width: 80.0,),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/male.png'),
                      radius: 60.0,
                    ),
                  ],
                ),
                const SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Female()));
                      },
                      color: Colors.grey[900],
                      child: const Text(
                        'FEMALE',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 85.0,),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Male()));
                      },
                      color: Colors.grey[900],
                      child: const Text(
                        'MALE',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
