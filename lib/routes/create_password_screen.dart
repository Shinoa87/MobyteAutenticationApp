// import 'package:flutter/material.dart';
// import '../classes/static_fields.dart';
// import '../widgets/custom_arrow_back.dart';
// import '../widgets/custom_textformfield_widget.dart';
// import '../widgets/elevated_button_widget.dart';
// import 'login_screen.dart';
//
//  class CreatePasswordScreen extends StatefulWidget {
//    const CreatePasswordScreen({Key? key}) : super(key: key);
//
//    static String id = 'create_password_screen';
//
//    @override
//    State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
//  }
//
//  class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
//    @override
//    Widget build(BuildContext context) {
//
//      // final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
//
//      return Scaffold(
//        body: Padding(
//          padding: const EdgeInsets.all(16.0),
//          child: SingleChildScrollView(
//            reverse: true,
//            child: Stack(
//              children: [
//                Column(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: [
//                      SizedBox(height: 260),
//                      Column(
//                        children: [
//                          Container(
//                            padding: EdgeInsets.only(left: 11),
//                            alignment: Alignment.centerLeft,
//                            child: Text(
//                              'Create Password',
//                              style: TextStyle(
//                                fontSize: 20,
//                                fontWeight: FontWeight.w700,
//                                color: Color(0xff1B1B1B),
//                              ),
//                            ),
//                          ),
//                          SizedBox(height: 18,),
//                          Container(
//                            padding: EdgeInsets.only(left: 11),
//                            alignment: Alignment.centerLeft,
//                            child: Text(
//                              'Create your new password to login',
//                              style: TextStyle(
//                                fontSize: 16,
//                                fontWeight: FontWeight.w600,
//                                color: Color(0xff757575),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                      SizedBox(height: 18,),
//                      CustomTextFormField(hintText: 'Password',showEye: true,),
//                      SizedBox(height: 24,),
//                      CustomTextFormField(hintText: 'Confirm password',showEye: true,),
//                      SizedBox(height: 24,),
//                      CustomElevatedButton(
//                        title: 'Create password',
//                        buttonColour: StaticConst.kMainColorTheme,
//                        titleColour: Colors.white,
//                        onPressed:() => Navigator.pushNamed(context, LoginScreen.id)
//                      ),
//                    ]
//                ),
//                Positioned(
//                  top: 70,
//                  child: CustomArrowBack(),
//                ),
//              ],
//            ),
//          ),
//        ),
//      );
//    }
//  }
