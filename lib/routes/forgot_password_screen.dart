import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../classes/static_fields.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/custom_textformfield_widget.dart';
import '../widgets/elevated_button_widget.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static String id = 'forgot_password_screen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? errorMessage;

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          reverse: true,
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 260),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 11),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Forgot Your Password?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff1B1B1B),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 11),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            StaticConst.forgotText,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff757575),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24,),
                    CustomTextFormField(
                      hintText: 'Email or username',
                      showEye: false,
                      controller: emailController,
                      validator: (value) =>
                      value != null && !EmailValidator.validate(value)
                          ? 'Enter a valid name'
                          : null,
                    ),
                    SizedBox(height: 24,),
                    CustomElevatedButton(
                      title: 'Reset my password',
                      buttonColour: StaticConst.kMainColorTheme,
                      titleColour: Colors.white,
                      onPressed: resetPassword,
                      // () => Navigator.pushNamed(context, VerificationCodeScreen.id),
                    ),
                  ]
                ),
              ),
              Positioned(
                top: 70,
                child: CustomArrowBack(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future resetPassword() async {

    final isValid = _formKey.currentState!.validate();
    if (!isValid) return ;

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text
      );
      Fluttertoast.showToast(msg: "Check your email");
      Navigator.pushNamed(context, LoginScreen.id);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
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
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }
}
