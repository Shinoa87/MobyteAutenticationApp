import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobyte_app/routes/user_screen.dart';
import '../classes/static_fields.dart';
import '../models/user_model.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/custom_textformfield_widget.dart';
import '../widgets/elevated_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationTrueScreen extends StatefulWidget {
  const RegistrationTrueScreen({Key? key}) : super(key: key);

  static String id = 'registration_true_screen';

  @override
  State<RegistrationTrueScreen> createState() => _RegistrationTrueScreenState();
}

class _RegistrationTrueScreenState extends State<RegistrationTrueScreen> {


  final _auth = FirebaseAuth.instance;

  String? errorMessage;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery
        .of(context)
        .viewInsets
        .bottom != 0;

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 70, right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isKeyboard) CustomArrowBack(),
                if (!isKeyboard) SizedBox(height: 24,),
                if (!isKeyboard) Image(
                  width: 170,
                  height: 170,
                  image: AssetImage('images/logo.png',),
                ),
                SizedBox(height: 24,),
                CustomTextFormField(
                  hintText: 'Username',
                  showEye: false,
                  controller: usernameController,
                  validator: (value) =>
                  value != null && value.length < 3
                      ? 'Enter minimum 3 characters'
                      : null,
                  // onChanged: (value) => username = value
                ),
                SizedBox(height: 24,),
                CustomTextFormField(
                  hintText: 'Email',
                  showEye: false,
                  controller: emailController,
                  validator: (value) =>
                  value != null && !EmailValidator.validate(value)
                      ? 'Enter a valid name'
                      : null,
                  // onChanged: (value) => email = value,
                ),
                SizedBox(height: 24,),
                CustomTextFormField(hintText: 'Password', showEye: true,
                  controller: passwordController,
                  validator: (value) =>
                  value != null && value.length < 6
                      ? 'Enter minimum 6 characters'
                      : null,
                  // onChanged: (value) => password = value
                ),
                SizedBox(height: 24,),
                CustomTextFormField(
                  hintText: 'Confirm password',
                  showEye: true,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (confirmPasswordController.text !=
                        passwordController.text) {
                      return "Password don't match";
                    }
                    return null;
                  },
                  // onChanged: (value) => confirmedPassword = value
                ),
                SizedBox(height: 24,),
                CustomElevatedButton(
                  title: 'Register',
                  buttonColour: StaticConst.kMainColorTheme,
                  titleColour: Colors.white,
                  onPressed: () {
                    signUp(emailController.text, passwordController.text);
                  }
                  //     () async {
                  //   try {
                  //     final newUser = await _auth.createUserWithEmailAndPassword(
                  //         email: email, password: password);
                  //     if (newUser != null && password == confirmedPassword){
                  //       Navigator.pushNamed(context, UserScreen.id);
                  //     }
                  //   }
                  //   catch (e) {
                  //     print(e);
                  //   }
                  // },
                  //     () => Navigator.pushNamed(context, UserScreen.id),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushNamed(context, UserScreen.id);
  }
}