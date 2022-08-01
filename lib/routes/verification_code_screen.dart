import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../classes/static_fields.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/elevated_button_widget.dart';
import 'create_password_screen.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  static String id = 'verification_code_screen';

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {

  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          reverse: true,
          child: Stack(
            children: [
              Column(
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
                            'Enter Verification Code',
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
                            'Enter code that we have sent to your email ${StaticConst.email}',
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

                    // PinCodeTextField(
                    //   appContext: context,
                    //   length: 4,
                    //   obscureText: false,
                    //   animationType: AnimationType.fade,
                    //   pinTheme: PinTheme(
                    //     shape: PinCodeFieldShape.box,
                    //     borderRadius: BorderRadius.circular(5),
                    //     fieldHeight: 60,
                    //     fieldWidth: 60,
                    //     activeFillColor: Color(0xffF1F4FA),
                    //   ),
                    //   animationDuration: Duration(milliseconds: 300),
                    //   backgroundColor: Colors.white,
                    //   enableActiveFill: true,
                    //   errorAnimationController: errorController,
                    //   controller: textEditingController,
                    //   onCompleted: (v) {
                    //     print("Completed");
                    //   },
                    //   onChanged: (value) {
                    //     print(value);
                    //     setState(() {
                    //       currentText = value;
                    //     });
                    //   },
                    //   beforeTextPaste: (text) {
                    //     print("Allowing to paste $text");
                    //     return true;
                    //   },
                    // ),

                    Form(
                      key: formKey,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 0),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 4,
                            obscureText: false,
                            obscuringCharacter: '*',
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              activeColor: Colors.grey,
                              borderWidth: 2,
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              disabledColor: Color(0xffF1F4FA),
                              selectedColor: Color(0xff8A5DA5),
                              selectedFillColor: Color(0xffF1F4FA),
                              inactiveColor: Colors.grey,
                              fieldHeight: 60,
                              fieldWidth: 70,
                              activeFillColor: Color(0xffF1F4FA),
                            ),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            textStyle: TextStyle(fontSize: 20, height: 1.6),
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            onCompleted: (v) {
                              print("Completed");
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          )
                      ),
                    ),
                    CustomElevatedButton(
                      title: 'Verify',
                      buttonColour: StaticConst.kMainColorTheme,
                      titleColour: Colors.white,
                      onPressed: () {}
                      // => Navigator.pushNamed(context, CreatePasswordScreen.id),
                    ),
                    SizedBox(height: 36,),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff8A5DA5),
                        ),
                      ),
                    ),
                  ]
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
}



// Form(
// key: formKey,
// child: Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 8.0, horizontal: 30),
// child: PinCodeTextField(
// appContext: context,
// pastedTextStyle: TextStyle(
// color: Colors.green.shade600,
// fontWeight: FontWeight.bold,
// ),
// length: 6,
// obscureText: false,
// obscuringCharacter: '*',
// animationType: AnimationType.fade,
// validator: (v) {
// if (v.length < 3) {
// return "I'm from validator";
// } else {
// return null;
// }
// },
// pinTheme: PinTheme(
// shape: PinCodeFieldShape.box,
// borderRadius: BorderRadius.circular(5),
// fieldHeight: 60,
// fieldWidth: 50,
// activeFillColor:
// hasError ? Colors.orange : Colors.white,
// ),
// cursorColor: Colors.black,
// animationDuration: Duration(milliseconds: 300),
// textStyle: TextStyle(fontSize: 20, height: 1.6),
// backgroundColor: Colors.blue.shade50,
// enableActiveFill: true,
// errorAnimationController: errorController,
// controller: textEditingController,
// keyboardType: TextInputType.number,
// boxShadows: [
// BoxShadow(
// offset: Offset(0, 1),
// color: Colors.black12,
// blurRadius: 10,
// )
// ],
// onCompleted: (v) {
// print("Completed");
// },
// // onTap: () {
// //   print("Pressed");
// // },
// onChanged: (value) {
// print(value);
// setState(() {
// currentText = value;
// });
// },
// beforeTextPaste: (text) {
// print("Allowing to paste $text");
// //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
// //but you can show anything you want here, like your pop up saying wrong paste format or etc
// return true;
// },
// )),
// ),
