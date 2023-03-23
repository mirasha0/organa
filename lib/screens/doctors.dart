import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'doc_type.dart';

import 'login_screen.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {

  List<Type> doctorTypeList = [
    Type('assets/doctorImg/hart.PNG', 'Cardiologist'),
    Type('assets/doctorImg/lungs.PNG', 'Pulmonologist'),
    Type('assets/doctorImg/kidney.PNG', 'Nephrologist'),
    Type('assets/doctorImg/liver.PNG', 'Gastroenterologist'),
    Type('assets/doctorImg/bowel.PNG', 'Hepatologist'),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Doctors"),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body:  SizedBox(
        height: 250,
        child: ScrollSnapList(
          itemBuilder: _buildListItem,
          itemCount: doctorTypeList.length,
          itemSize: 250,
          onItemFocus: (index) {},
          dynamicItemSize: true,
        ),
      ));

  }
  Widget _buildListItem(BuildContext context, int index) {
    Type type = doctorTypeList[index];
    return SizedBox(
      width: 180,
      height: 300,
      child: Card(
        elevation: 12,
        child: ClipRRect(
          borderRadius:  BorderRadius.circular(20),
      child:  Column(
        children: [
              Image.asset(
                type.imagePath,
                fit: BoxFit.fill,
                width: 130,
               height: 180,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                type.title,
                style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

Future<void> logout(BuildContext context) async {
  const CircularProgressIndicator();
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ),
  );
}
