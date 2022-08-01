import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobyte_app/routes/registration_true_screen.dart';
import 'package:mobyte_app/routes/user_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../classes/static_fields.dart';
import 'dart:io' show Platform;
import '../widgets/custom_textformfield_widget.dart';
import '../widgets/elevated_button_widget.dart';
import 'forgot_password_screen.dart';
import '../classes/static_fields.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {

  // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  String? errorMessage;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // GoogleSignInAccount? googleUser = _googleSignIn.currentUser;

    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 33,),
                Image(
                  width: 170,
                  height: 170,
                  image: AssetImage('images/logo.png',),
                ),
                SizedBox(height: 24,),
                CustomTextFormField(
                  hintText: 'Username or email',
                  showEye: false,
                  controller: emailController,
                  validator: (value) =>
                  value != null && !EmailValidator.validate(value)
                      ? 'Enter a valid name'
                      : null,
                ),
                SizedBox(height: 24,),
                CustomTextFormField(
                  hintText: 'Password',
                  showEye: true,
                  controller: passwordController,
                  validator: (value) =>
                  value != null && value.length < 6
                      ? 'Enter minimum 6 characters'
                      : null,
                ),
                SizedBox(height: 6,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, ForgotPasswordScreen.id),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: StaticConst.kMainColorTheme,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24,),
                CustomElevatedButton(
                  title: 'Login',
                  titleColour: StaticConst.kMainColorTheme,
                  buttonColour: Colors.white,
                  onPressed: () {
                    signIn(emailController.text, passwordController.text);
                  },
                  //бывший онпрессед
                  // onPressed: signIn,
                ),
                SizedBox(height: 24,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff757575),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(
                                context, RegistrationTrueScreen.id),
                        // onTap: ,
                        child: Text(
                          ' Sign up',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: StaticConst.kMainColorTheme,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.4,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            )
                        ),
                      ),
                      SizedBox(width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.02,),
                      Text(
                        'or',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff757575),
                        ),
                      ),
                      SizedBox(width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.02,),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.4,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                Platform.isAndroid ? Stack(
                  children: [
                    CustomElevatedButton(
                      title: 'Sign in with Google',
                      titleColour: StaticConst.kMainColorTheme,
                      buttonColour: Colors.white,
                      onPressed: () {
                        // await _googleSignIn.signIn();
                        // setState(() {});
                      },
                    ),
                    Positioned(
                      left: 21,
                      top: 11,
                      child: Image(
                        image: AssetImage('images/google_moogle.png'),
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ) :
                Column(
                  children: [
                    Stack(
                      children: [
                        CustomElevatedButton(
                          title: 'Sign in with Google',
                          titleColour: StaticConst.kMainColorTheme,
                          buttonColour: Colors.white,
                          onPressed: () {
                            // await _googleSignIn.signIn();
                            // setState(() {});
                          },
                        ),
                        Positioned(
                          left: 21,
                          top: 11,
                          child: Image(
                            image: AssetImage('images/google_moogle.png'),
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24,),
                    Stack(
                      children: [
                        CustomElevatedButton(
                          title: 'Sign in with AppleStore',
                          buttonColour: Colors.black,
                          titleColour: Colors.white,
                          onPressed: () {
                            // await _googleSignIn.signIn();
                            // setState(() {});
                          },
                        ),
                        Positioned(
                          left: 21,
                          top: 11,
                          child: Icon(Icons.apple_outlined, color: Colors.white,
                              size: 30),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
          ),
        ),
      ),
    );
  }

  //пробую другой метод логина...
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) =>
        {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.pushNamed(context, UserScreen.id)
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
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
}

  //полностью работающий метод логина...(1 способ)
  // Future signIn() async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => Center(child: CircularProgressIndicator()),
  //   );
  //
  //   try{
  //     await  FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //
  //     // showSnackBar(e.message);
  //   }
  //   navigatorKey.currentState!.popUntil((route) => route.isFirst);
  // }
// }
