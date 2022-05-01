import 'package:flutter/material.dart';

class newsLetter extends StatelessWidget {
  const newsLetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
      child:Padding(
        padding: const EdgeInsets.fromLTRB(8,100,9,170),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child:  Form(
                child: Column(
                  children:[
                    const SizedBox(height: 30,),
                    const Text(
                      'Join Our Newsletter!',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      "Be one of the first people to know what click posture is up to!!",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        letterSpacing: 1.5,
                        height: 1.5
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12,),
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: const EdgeInsets.symmetric(horizontal: 42),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                    const SizedBox(height: 12,),
                    FlatButton(
                      color: Colors.pinkAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Subscribe',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                              ),
                            )
                        )
                      ]
                    ),
                  ),
              ),
          ),
        ),
    );
  }
}
