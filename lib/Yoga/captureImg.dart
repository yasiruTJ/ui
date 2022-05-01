import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'output.dart';


class captureImageYoga extends StatelessWidget {
  const captureImageYoga({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyHomePage(title: 'Image Capture'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _CaptureImageState();
}


class _CaptureImageState extends State<MyHomePage> {

  File? image;
  UploadTask? uploadTask;

  Future uploadFile() async{
    final path = 'Inputs_Yoga/image';
    final file = File(image!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayOutputYoga()));
    });

    final urlDownload = await snapshot.ref.getDownloadURL();
    print(urlDownload);

  }


  Future pickImageGallery() async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    }on PlatformException catch(e){
      print('Failed To Pick Image : $e');
    }
  }

  Future pickImageCamera() async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    }on PlatformException catch(e){
      print('Failed To Pick Image : $e');
    }
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
                  pickImageGallery();
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text('Camera'),
                onTap: (){
                  pickImageCamera();
                },
              ),
            ],
          ),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture Image'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
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
            padding: const EdgeInsets.fromLTRB(0.0,20.0, 0.0, 0.0),
            child: Column(
              children: [
                if(image != null)
                  Expanded(
                      child: Container(
                        color: Colors.black,
                        child: Image.file(
                          File(image!.path),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                  ),
                SizedBox(height: 20.0,),
                RichText(
                    text: const TextSpan(
                      text: "* Please Enter Clear Images To Get The Most Accurate Outputs",
                      style: TextStyle(color: Colors.white, fontSize: 12,),
                    )
                ),
                SizedBox(height: 10.0,),
                FlatButton.icon(
                  onPressed: (){
                    _showChoiceDialog(context);
                  },
                  icon: const Icon(
                      Icons.camera
                  ),
                  label: Text('Capture Image'),
                  color: Colors.white,
                ),
                SizedBox(height: 10.0,),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: uploadFile,
                      child: const Text(
                        'Upload Files',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold
                      )
                        ,)
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


