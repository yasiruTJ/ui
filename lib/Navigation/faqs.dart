import 'package:flutter/material.dart';

class faqs extends StatelessWidget {
  const faqs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: 1000,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/back.jpg"),
                  fit: BoxFit.cover),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "FAQs",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildQuestion(
                    question: "What is the purpose of posture.io?",
                    answer:
                    "posture.io is used to identify the accuracy in different workout postures that target different muscle groups"),
                buildQuestion(
                    question:
                    "What platforms are supported by this application?",
                    answer:
                    "posture.io is a mobile application available for Android & IOS platforms."),
                buildQuestion(
                    question: "How can I get the app to my phone?",
                    answer:
                    "Android users can download the app through Google Play Store and iphone users can download using the apple store."),
                buildQuestion(
                    question: "Is this app free of charge?",
                    answer:
                    "Yes, our mobile app is completely free of charge to download and use."),
                buildQuestion(
                    question: "How to use this app?",
                    answer:
                    "First the user must create a new account by completing the sign up process and then can use the application by adding images or videos while engaging in these different workouts."),
                buildQuestion(
                    question: "Does this app work with all workouts?",
                    answer:
                    "No, this app only works with a limited number of workout exercises."),
                buildQuestion(
                    question: "Is it possible to use this app offline?",
                    answer:
                    "Yes, the user can use click posture without any internet connection")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildQuestion({required String question, required String answer}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  letterSpacing: 1.0),
            ),
            const SizedBox(height: 10,),
            Text(
              answer,
              style: TextStyle(
                  fontSize: 16, color: Colors.black87.withOpacity(0.6),),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}