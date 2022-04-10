import 'package:flutter/material.dart';
import 'package:sdgp_ui/choosegender.dart';
import 'package:sdgp_ui/welcome.dart';



class Login extends StatelessWidget {

  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //textfield

    String email = "";
    String password = "";

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: 1000,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/back.jpg"),
                fit: BoxFit.cover),
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: (val) {},
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
                  const SizedBox(height: 20.0,),
                  TextField(
                    obscureText: true,
                    onChanged: (val) {

                    },
                    decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.black,),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.security),
                          onPressed: () {},
                        )
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                  ),
                  const SizedBox(height: 10.0,),
                  GestureDetector(
                    onTap: (){
                      // forgot password thingy
                    },
                    child: const Text(
                    "Don't Remember Your Password?",
                    style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 40.0,),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
                    },
                    color: Colors.grey[900],
                    child: const Text(
                      'SIGN-IN',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald',
                      ),
                    ),
                  ),
                  const SizedBox(height: 140.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(text: const TextSpan(
                        text: "Don't have an Account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseGender()));
                        },
                          child: const Text(
                            "  Create",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                      ),
                    ],
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}


