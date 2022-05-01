
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:sdgp_ui/Screens/welcome.dart';

import 'auth_page.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: const Icon(
          Icons.fitness_center,
          color: Colors.white,
          size: 100,
        ),
        duration: 3000,
        nextScreen: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }else if (snapshot.hasError){
                return const Center(child: Text('Something went wrong!'));
              }else if(snapshot.hasData){
                return const Welcome();
              }else{
                return const AuthPage();
              }
            }
        ),
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale,
        backgroundColor: Colors.black
    );
  }
}



