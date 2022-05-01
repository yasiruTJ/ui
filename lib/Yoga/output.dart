import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_ui/Screens/select_user.dart';


class DisplayOutputYoga extends StatefulWidget {
  const DisplayOutputYoga({Key? key}) : super(key: key);

  @override
  State<DisplayOutputYoga> createState() => _DisplayOutputYogaState();
}

class _DisplayOutputYogaState extends State<DisplayOutputYoga> {


  // Future<Widget> _getImage(BuildContext context, String imageName) async {
  //   late Image image;
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    height: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/posture-io.appspot.com/o/Outputs_Yoga%2FMen_Round_Updated_with_5XL_2.jpg?alt=media&token=f025fdcf-1b5e-4aea-8aad-24ecb0e4162d"),
                  ),
                  SizedBox(height: 20.0,),
                  FlatButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Select()));
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

