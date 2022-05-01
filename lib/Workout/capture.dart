

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:sdgp_ui/Workout/output.dart';

import '../Screens/navigation_drawer_widget.dart';


class captureVideo extends StatelessWidget {
  const captureVideo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Image Capture'),
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
  FilePickerResult?result;
  String?_fileName;
  PlatformFile?pickedFile;
  bool isLoading = false;

  Future<void> PickFile() async {
    try{
      setState((){
        isLoading = true;
      });

  result = await FilePicker.platform.pickFiles(
        type:FileType.video,
        allowMultiple: false,
      );
  if (result != null){
    _fileName = result!.files.first.name;
    pickedFile = result!.files.first;

  }

      setState(() {
        isLoading = false;
      });
    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Capture Video'),
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(0,250,0,100),
                  child: Text(
                      'No Video Selected!',
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0,),
                RaisedButton.icon(
                  onPressed: ()  {
                    PickFile();
                  },
                  icon: const Icon(
                    Icons.camera
                  ),
                  label: const Text('Capture Video'),
                  color: Colors.white,
                ),
                const SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(280.0, 20.0, 0.0, 0.0),
                  child: FlatButton.icon(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayOutput()));
                  }, icon: const Icon(Icons.arrow_forward_sharp), label: Text(''),
                      color: Colors.white,
                      shape: const CircleBorder(side: BorderSide.none)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}


