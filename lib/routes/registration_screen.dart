// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:mobyte_app/routes/user_screen.dart';
// import '../classes/static_fields.dart';
// import '../main.dart';
// import '../widgets/custom_arrow_back.dart';
// import '../widgets/custom_textformfield_widget.dart';
// import '../widgets/elevated_button_widget.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({Key? key}) : super(key: key);
//
//   static String id = 'registration_screen';
//
//   @override
//   State<RegistrationScreen> createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//
//   // final _auth = FirebaseAuth.instance;
//   // late String username;
//   // late String email;
//   // late String password;
//   // late String confirmedPassword;
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final usernameController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//
//     final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 16, top: 70, right: 16),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 if (!isKeyboard) CustomArrowBack(),
//                 if (!isKeyboard) SizedBox(height:24,),
//                 if (!isKeyboard) Image(
//                   width: 170,
//                   height: 170,
//                   image: AssetImage('images/logo.png',),
//                 ),
//                 SizedBox(height:24,),
//                 CustomTextFormField(hintText: 'Username',showEye: false,
//                     controller: usernameController,
//                     // onChanged: (value) => username = value
//                 ),
//                 SizedBox(height:24,),
//                 CustomTextFormField(hintText: 'Email',showEye: false,
//                   controller: emailController,
//                   validator: (value) =>
//                   value != null && !EmailValidator.validate(value)
//                       ? 'Enter a valid name'
//                       : null,
//                   // onChanged: (value) => email = value,
//                 ),
//                 SizedBox(height:24,),
//                 CustomTextFormField(hintText: 'Password',showEye: true,
//                     controller: passwordController,
//                     validator: (value) =>
//                     value != null && value.length < 6
//                         ? 'Enter minimum 6 characters'
//                         : null,
//                     // onChanged: (value) => password = value
//                 ),
//                 SizedBox(height:24,),
//                 CustomTextFormField(hintText: 'Confirm password',showEye: true,
//                     controller: confirmPasswordController,
//                     // onChanged: (value) => confirmedPassword = value
//                 ),
//                 SizedBox(height:24,),
//                 CustomElevatedButton(
//                   title: 'Register',
//                   buttonColour: StaticConst.kMainColorTheme,
//                   titleColour: Colors.white,
//                   onPressed: register,
//                   //     () async {
//                   //   try {
//                   //     final newUser = await _auth.createUserWithEmailAndPassword(
//                   //         email: email, password: password);
//                   //     if (newUser != null && password == confirmedPassword){
//                   //       Navigator.pushNamed(context, UserScreen.id);
//                   //     }
//                   //   }
//                   //   catch (e) {
//                   //     print(e);
//                   //   }
//                   // },
//                   //     () => Navigator.pushNamed(context, UserScreen.id),
//                 ),
//               ],
//               // Image(),
//               // TextFormField(),
//               // TextFormField(),
//               // Row(
//               //   children: [
//               //
//               //   ]
//               // ),
//               // Row(
//               //   children: [
//               //
//               //   ]
//               // ),
//               // ElevatedButton(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   showSnackBar(String? text) {
//     if (text == null) return;
//
//     final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red,);
//
//     messengerKey.currentState!
//       ..removeCurrentSnackBar()
//       ..showSnackBar(snackBar);
//   }
//
//   Future register() async {
//     // final password = passwordController.text;
//     // final confirmPassword = confirmPasswordController;
//     //
//     // if (password == confirmPassword){
//
//     final isValid = _formKey.currentState!.validate();
//     if (!isValid) return ;
//
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => Center(child: CircularProgressIndicator()),
//       );
//
//
//       try {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//             email: emailController.text,
//             password: passwordController.text
//         );
//       } on FirebaseAuthException catch (e) {
//         print(e);
//
//         showSnackBar(e.message);
//         // Utils.showSnackBar(e.message);
//       }
//       navigatorKey.currentState!.popUntil((route) => route.isFirst);
//     // }
//   }
// }

