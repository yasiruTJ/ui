import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_ui/Screens/welcome.dart';

import '../Screens/main.dart';


class CreateAccount extends StatefulWidget {

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Future signUp() async{
      final isValid = formKey.currentState!.validate();
      if(!isValid) return;

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(child: CircularProgressIndicator(),));

      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
      }catch (error){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.toString()))
        );
      }

      navigatorKey.currentState!.popUntil((route)=> route.isFirst);


    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
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
          padding: const EdgeInsets.fromLTRB(0.0,180.0, 0.0, 0.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                    TextFormField(
                      controller: emailController,
                      validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
                      decoration: InputDecoration(
                        hintText: 'User Email',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                          prefixIcon: const Icon(Icons.mail, color: Colors.black,)
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                const SizedBox(height: 20.0,),
                 TextFormField(
                    controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                     ? 'Password should be at least 6 characters'
                     : null,
                    decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      prefixIcon: const Icon(Icons.lock, color: Colors.black,),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  maxLength: 15,
                ),
                const SizedBox(height: 10.0,),
                ElevatedButton.icon(
                    onPressed: signUp,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[900],
                      padding: EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 32,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Create My Account',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    )
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}