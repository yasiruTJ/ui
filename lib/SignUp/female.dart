import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdgp_ui/SignUp/createacc.dart';

class Female extends StatefulWidget {
  const Female({Key? key}) : super(key: key);


  @override
  State<Female> createState() => _FemaleState();

}

class User{
  String id;
  final String name;
  final int age;
  final int height;
  final int weight;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.height,
    required this.weight
  });

  Map<String,dynamic> toJson()=>{
    'id': id,
    'name': name,
    'age': age,
    'height': height,
    'weight':weight
  };
}

class _FemaleState extends State<Female> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Future createUser(User user) async {
      final docUser = FirebaseFirestore.instance.collection('female_info').doc();
      user.id = docUser.id;

      final json = user.toJson();
      await docUser.set(json);
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Enter Details'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
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
                padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          fillColor: Colors.white,
                          filled: true,
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(height: 15.0,),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                      child: TextFormField(
                        controller: ageController,
                        decoration: const InputDecoration(
                          hintText: 'Age',
                          fillColor: Colors.white,
                          filled: true,
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter. digitsOnly],
                        maxLength: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                      child: TextFormField(
                        controller: heightController,
                        decoration: const InputDecoration(
                          hintText: 'Height (cm) ',
                          fillColor: Colors.white,
                          filled: true,
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter. digitsOnly],
                        maxLength: 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                      child: TextFormField(
                        controller: weightController,
                        decoration: const InputDecoration(
                          hintText: 'Weight (Kg) ',
                          fillColor: Colors.white,
                          filled: true,
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter. digitsOnly],
                        maxLength: 3,
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    FlatButton(
                      onPressed: () {
                        final user = User(
                          name: nameController.text,
                          age: int.parse(ageController.text),
                          height: int.parse(heightController.text),
                          weight: int.parse(weightController.text),
                        );

                        createUser(user);

                         Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CreateAccount()));
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


