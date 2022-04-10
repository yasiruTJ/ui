import 'package:flutter/material.dart';
import 'package:sdgp_ui/createacc.dart';

void main() => runApp(MaterialApp(
  home: Female(),
  routes: {
    '/create' : (context) => CreateAccount(),
  },
));

class Female extends StatelessWidget {
  const Female({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Enter Details'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
        ),
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Center(
              child: Container(
              height: 1000,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/back.jpg"),
                    fit: BoxFit.cover),
              ),
                child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0,60.0, 0.0, 0.0),
                  child: Column(
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('images/female.png'),
                        radius: 80.0,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0,),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                        fillColor: Colors.white,
                        filled: true,
                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 15.0,),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Age',
                        fillColor: Colors.white,
                        filled: true,
                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 15.0,),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Height (cm) ',
                        fillColor: Colors.white,
                        filled: true,
                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 15.0,),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Weight (Kg) ',
                        fillColor: Colors.white,
                        filled: true,
                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20.0,),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
                      },
                      color: Colors.grey[900],
                      child: const Text(
                        'Next',
                          style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ),
                  ],
                 ),
               ),
             ),
       ),
          ),
        ),
    );
  }
}
