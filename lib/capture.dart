import 'package:flutter/material.dart';
import 'package:sdgp_ui/legs.dart';
import 'package:sdgp_ui/arms.dart';
import 'package:sdgp_ui/shoulders.dart';


void main() => runApp(MaterialApp(
  home: captureVid(),
  routes: {
    '/legs' : (context) => Legs(),
    '/arms' : (context) => Arms(),
    '/shoulders' : (context) => Shoulders(),
  },
));


class captureVid extends StatelessWidget {


  _openCamera(){

  }

  Future<void>_showChoiceDialog(BuildContext context){

    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text('Make A Choice!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              GestureDetector(
                child: Text('Gallery'),
                onTap: (){
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text('Camera'),
                onTap: (){
                  _openCamera();
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  const captureVid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture Video'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
        height: 1000,
        width: double.infinity,
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("images/back.jpg"),
        fit: BoxFit.cover),
        ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,50.0, 0.0, 0.0),
            child: Column(
              children: [
                const Text(
                    'No Video Selected!',
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                  ),
                ),
                SizedBox(height: 450.0,),
                RaisedButton.icon(
                  onPressed: (){
                    _showChoiceDialog(context);
                  },
                  icon: Icon(
                    Icons.camera
                  ),
                  label: Text('Capture Video'),
                  color: Colors.white,
                ),
                SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


