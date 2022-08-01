import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobyte_app/models/user_model.dart';
import 'login_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  static String id = 'user_screen';

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  final User? user = FirebaseAuth.instance.currentUser!;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: 250,
                  height: 250,
                  image: AssetImage('images/logo.png',),
                ),
                SizedBox(height: 41,),
                GestureDetector(
                  onTap:() {},
                  child: Text(
                    "${loggedInUser.username}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                GestureDetector(
                  onTap:() {},
                  child: Text(
                    "${loggedInUser.email}",
                      // user.email!,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                GestureDetector(
                  onTap:() {
                    logout(context);
                  },
                      //он тап здорового человека(1 способ)
                      // () => FirebaseAuth.instance.signOut(),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black,
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, LoginScreen.id);
  }
}
