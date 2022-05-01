import 'package:flutter/material.dart';
import 'package:sdgp_ui/Screens/selectInput.dart';



class Arms extends StatelessWidget {
  const Arms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arm Exercises'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
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
                  backgroundImage: AssetImage('images/arm1.png'),
                  radius: 50.0,
                ),
                const SizedBox(height: 5.0,),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectInput()));
                  },
                  color: Colors.grey[900],
                  child: const Text(
                    'BICEP CURL',
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
                  backgroundImage: AssetImage('images/arm2.png'),
                  radius: 50.0,
                ),
                const SizedBox(height: 5.0,),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectInput()));
                  },
                  color: Colors.grey[900],
                  child: const Text(
                    'DUMBBELL ROW',
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
                  backgroundImage: AssetImage('images/arm3.png'),
                  radius: 50.0,
                ),
                const SizedBox(height: 5.0,),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectInput()));
                  },
                  color: Colors.grey[900],
                  child: const Text(
                    'LATERAL RAISE',
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

