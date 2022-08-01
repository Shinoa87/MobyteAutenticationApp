import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_app/routes/user_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'login_screen_widget.dart';

 class LoginScreen extends StatefulWidget {
   const LoginScreen({Key? key}) : super(key: key);

   static String id = 'login_screen';
 
   @override
   State<LoginScreen> createState() => _LoginScreenState();
 }

 class _LoginScreenState extends State<LoginScreen> {

   void initState() {
     super.initState();
     FlutterNativeSplash.remove();
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       body: StreamBuilder<User?>(
         stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context, snapshot){
           if(snapshot.hasData) {
             return UserScreen();
           } else {
             return LoginScreenWidget();
           }
         },
       ),
     );
   }
 }



























// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../routes/registration_screen.dart';
// import '../widgets/custom_textformfield_widget.dart';
// import '../widgets/elevated_button_widget.dart';
// import '../classes/static_fields.dart';
// import 'dart:io' show Platform;
// import 'package:flutter_signin_button/flutter_signin_button.dart';
//
// import 'forgot_password_screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   static String id = 'login_screen';
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children : [
//                 SizedBox(height: 33,),
//                 Image(
//                   width: 170,
//                   height: 170,
//                   image: AssetImage('images/logo.png',),
//                 ),
//                 SizedBox(height:24,),
//                 CustomTextFormField(hintText: 'Username or Phone number', showEye: false, controller: emailController,),
//                 SizedBox(height:24,),
//                 CustomTextFormField(hintText: 'Password', showEye: true, controller: passwordController,),
//                 SizedBox(height: 6,),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   child: GestureDetector(
//                     onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.id),
//                     child: Text(
//                       'Forgot Password?',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff8A5DA5),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 24,),
//                 CustomElevatedButton(
//                   title: 'Login',
//                   titleColour: StaticConst.kMainColorTheme,
//                   buttonColour: Colors.white,
//                   onPressed: signIn,
//                 ),
//                 SizedBox(height: 24,),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Don’t have an account?',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14,
//                           color: Color(0xff757575),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => Navigator.pushNamed(context, RegistrationScreen.id),
//                         child: Text(
//                           ' Sign up',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14,
//                             color: StaticConst.kMainColorTheme,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 24,),
//                 // Container(
//                 //   width: MediaQuery.of(context).size.width,
//                 //   child: Row(
//                 //     mainAxisAlignment: MainAxisAlignment.center,
//                 //     children: [
//                 //       Container(
//                 //         width: MediaQuery.of(context).size.width * 0.4,
//                 //         decoration: BoxDecoration(
//                 //           border: Border.all()
//                 //         ),
//                 //       ),
//                 //       SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
//                 //       Text(
//                 //         'or',
//                 //         style: TextStyle(
//                 //           fontWeight: FontWeight.w400,
//                 //           fontSize: 14,
//                 //           color: Color(0xff757575),
//                 //         ),
//                 //       ),
//                 //       SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
//                 //       Container(
//                 //         width: MediaQuery.of(context).size.width * 0.4,
//                 //         decoration: BoxDecoration(
//                 //             border: Border.all()
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 Stack(
//                   children: [
//                     CustomElevatedButton(
//                       title: 'Sign in with Google',
//                       titleColour: StaticConst.kMainColorTheme,
//                       buttonColour: Colors.white,
//                       onPressed: () {},
//                     ),
//                     Positioned(
//                       left: 21,
//                       top: 11,
//                       child: Image(image: AssetImage('images/google_moogle.png'),width: 30, height: 30,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 24,),
//                 // GestureDetector(child:Text()),
//                 // Row(
//                 //   children: [
//                 //
//                 //   ]
//                 // ),
//                 // ElevatedButton(),
//               ]
//           ),
//         ),
//       ),
//     );
//   }
//   Future signIn() async {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     );
//   }
// }

 