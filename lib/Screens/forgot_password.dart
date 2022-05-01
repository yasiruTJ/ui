import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForgotPassword extends StatefulWidget {


  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}


class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override

  void dispose(){
    emailController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Reset Password'),
      ),
      body: SingleChildScrollView(
        child: Container(
        height: 1000,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/back.jpg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,5,20,0),
          child: Form(
            //key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Lottie.asset("lotties/thinking.json"),
                ),
                const SizedBox(height: 5,),
                RichText(
                    text: const TextSpan(
                      text:'Please Enter The Email That You Used To Create An Account',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.black,),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (email)=>
                  // email != null && EmailValidator.validate(email)
                  //     ? 'Enter a valid email'
                  //     : null,
                ),
                const SizedBox(height: 20,),
                ElevatedButton.icon(
                    onPressed: resetPassword,
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey[900],
                        padding: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        )
                    ),
                    icon: const Icon(
                      Icons.question_answer_rounded,
                      size: 32,
                      color: Colors.white,
                    ),
                    label : const Text(
                      'RESET PASSWORD',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald',
                      ),
                    ),
                ),
              ],
            ),
          ),
        )
        ),
      ),
    );

  }
  Future resetPassword() async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim()
      );
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password Reset Email Was Sent To Your Account!'))
      );
    }catch (error){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString()))
      );
    }

  }

}
