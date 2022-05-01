import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'forgot_password.dart';
import 'main.dart';
import 'navigation_drawer_widget.dart';


class Login extends StatefulWidget {

  final VoidCallback onClickedSignUp;

  Login({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    Future signIn() async{
      final isValid = formKey.currentState!.validate();
      if(!isValid) return;

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(child: CircularProgressIndicator(),));

      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      }catch (error){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString()))
        );
      }

      navigatorKey.currentState!.popUntil((route)=> route.isFirst);
    }

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
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
            padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Center(
                    child: TextFormField(
                      controller: emailController,
                       // validator: (email)=> email != null && EmailValidator.validate(email)
                       //     ? 'Enter a valid email'
                       //     : null,
                      decoration: InputDecoration(
                        hintText: 'User Email',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIcon: const Icon(Icons.mail, color: Colors.black,),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Center(
                    child: TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Password should be at least 6 characters'
                          : null,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.black,),
                      ),
                      keyboardType: TextInputType.text,
                      maxLength: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(270,0,10,0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                      },
                      child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0,),
                  ElevatedButton.icon(
                    onPressed: signIn,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[900],
                        padding: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        )
                      ),
                        icon: const Icon(
                            Icons.lock_open,
                            size: 32,
                            color: Colors.white,
                            ),
                        label : const Text(
                          'SIGN-IN',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Oswald',
                            ),
                          )
                      ),
                  const SizedBox(height: 140.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Don't have an Account?",
                          style: const TextStyle(color: Colors.white, fontSize: 16,),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignUp,
                              text: 'Create',
                              style: const TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                            )
                          ]
                      )
                      ),
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );

  }
}


