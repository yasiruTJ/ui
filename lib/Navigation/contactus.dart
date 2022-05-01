import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class contactUs extends StatelessWidget {
  const contactUs({Key? key}) : super(key: key);

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
                  children:  [
                    const SizedBox(height: 20.0,),
                    const Text(
                      'Contact Us',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Lottie.asset("lotties/contactus.json"),
                    const SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25,15,25,0),
                      child: Container(
                        child: Column(
                        children: const [
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "contact.posture.io@gmail.com",
                              prefixIcon: Icon(Icons.mail, color: Colors.deepPurple,),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "0716877729",
                              prefixIcon: Icon(Icons.phone, color: Colors.deepPurple,),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Click Posture",
                              prefixIcon: Icon(Icons.facebook, color: Colors.deepPurple,),
                            ),
                          ),
                          ]
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
