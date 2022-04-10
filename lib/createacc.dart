import 'package:flutter/material.dart';
import 'package:sdgp_ui/login.dart';

void main() => runApp(MaterialApp(
  home: CreateAccount(),
));


class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.fromLTRB(0.0,120.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  TextField(
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
               TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  fillColor: Colors.white,
                  filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: const Icon(Icons.lock, color: Colors.black,),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.security),
                    onPressed: () {  },
                  )
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 5,
              ),
              const SizedBox(height: 10.0,),
              FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                },
                color: Colors.grey[900],
                child: const Text(
                  'CREATE MY ACCOUNT',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald',
                  ),
                ),
              ),
              const SizedBox(height: 80.0,),
              RichText(text: const TextSpan(
                text: "Sign Up With Any Of These Methods",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              ),
              SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/google.png'),
                  ),
                  SizedBox(width: 15.0),
                  CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/tiwtter.png'),
                  ),
                  SizedBox(width: 15.0),
                  CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/fb.png'),
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}