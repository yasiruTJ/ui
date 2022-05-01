import 'package:flutter/material.dart';

class aboutUs extends StatelessWidget {
  const aboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.black,
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
            padding: const EdgeInsets.all(30.0),
            child: Card(
              elevation: 8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage('images/about.png'),
                    radius: 90.0,
                  ),
                  const SizedBox(height: 20.0,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,0,30,0),
                    child: Container(
                      child: const Text(
                        "click posture is specifically designed for all the fitness enthusiasts out there, to help them identify their workout postures. Our mission is to help everyone in all the age groups to guide them towards a healthy lifestyle while engaging in  correct forms of exercises. Our app can help you find the accuracy of your workout posture and provide you with hints and information on how ot correct and improve it.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          wordSpacing: 2.0,
                          height: 1.5
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
