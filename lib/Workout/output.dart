import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_ui/Screens/select_user.dart';


class DisplayOutput extends StatefulWidget {

  @override
  State<DisplayOutput> createState() => _DisplayOutputState();
}

class _DisplayOutputState extends State<DisplayOutput> {


  Future checkFile() async {
    final path = 'Outputs/young-fitness-man-studio.jpg';

    final ref = FirebaseStorage.instance.ref().child(path).getDownloadURL();


  }
  // Future<Widget> _getImage(BuildContext context, String imageName) async {
  //   Image image;
  //   await FireStorageService.loadImage(context, imageName).then((value) {
  //     image = Image.network(
  //         value.toString(),
  //         fit: BoxFit.scaleDown,
  //     );
  //   });
  //   return image;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display The Output'),
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.width / 1.2,
                    child: Image.network("https://firebasestorage.googleapis.com/v0/b/posture-io.appspot.com/o/Outputs%2Fyoung-fitness-man-studio.jpg?alt=media&token=a55682d1-3699-452b-b7ad-9572542e1e73"),
                ),
              SizedBox(height: 20.0,),
              FlatButton.icon(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Select()));
                },
                  icon: const Icon(
                      Icons.camera
                  ),
                  label: Text('Analyze Another Workout'),
                  color: Colors.white,
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}

// class FireStorageService extends ChangeNotifier{
//   FireStorageService();
//   static Future<dynamic> loadImage(BuildContext context, String Image) async{
//     return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
//   }
// }

