import 'package:flutter/material.dart';

class help extends StatelessWidget {
  const help({Key? key}) : super(key: key);

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
            height: 2000,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/back.jpg"),
                  fit: BoxFit.cover),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                const Text(
                  "How Can We Help You?",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                const SizedBox(height: 20,),
                const Text(
                  "PROFILE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20,),
                buildQuestion(
                    question: "How do I access my click posture account in new device?",
                    answer:
                    "If you want to log into ur old account using a new device, please follow the below steps.\n 1.Open click posture in your new device.\n 2.On the login page please enter your email and password that you used to register your account.\n3.If you can't remember your password, click on 'Forgot password?' and follow the steps to recover your account"),
                buildQuestion(
                    question:
                    "Do I need to sign up to use click posture?",
                    answer:
                    "Yes, you do need to sign up to use the application."),
                buildQuestion(
                    question:
                    "How do I recover my account?",
                    answer:
                    "Please follow the below steps to recover your account.\n 1. Click on 'Forgot Password?' in the login page \n 2.Go through the steps and provide necessary information to recover your account"),
                const SizedBox(height: 20,),
                const Text(
                  "ANALYZING POSTURE",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20,),
                buildQuestion(
                    question: "What Can Be Analyzed using click posture? ",
                    answer:
                    "There are Two Types of Information You Can Provide To The System\n 1. Images \n 2. Videos"),
                buildQuestion(
                    question: "How Can I add the images to the system?",
                    answer:
                    "Navigate To The 'Input Selection' page and select the type of input that you want to add to the system.(Either Image Or Video)"),
                buildQuestion(
                    question: "What Are The Options When Selecting An Image or A Video",
                    answer:
                    "There are two ways of adding an image or a video to the system,\n 1. Capture A Live Image through the camera by pressing on the 'Capture Image' button\n 2. Add A image or a video from the gallery by clicking on 'Add From Gallery' "),
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
                  color: Colors.black87),
            ),
            const SizedBox(height: 10,),
            Text(
              answer,
              style: TextStyle(
                  fontSize: 16, color: Colors.black87.withOpacity(0.6),height: 2.0),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}