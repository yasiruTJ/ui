
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'onboard.dart';


final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    home: OnBoardingScreen(),
  ));
}


