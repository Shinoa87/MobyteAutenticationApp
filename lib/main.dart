import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_app/routes/registration_true_screen.dart';
import '../routes/login_screen.dart';
import '../routes/forgot_password_screen.dart';
import '../routes/user_screen.dart';
import '../routes/verification_code_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


Future main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(MyApp());
}
final messengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        // RegistrationScreen.id: (context) => const RegistrationScreen(),
        ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
        VerificationCodeScreen.id: (context) => const VerificationCodeScreen(),
        RegistrationTrueScreen.id: (context) => const RegistrationTrueScreen(),
        // CreatePasswordScreen.id: (context) => const CreatePasswordScreen(),
        UserScreen.id: (context) => const UserScreen(),
      },
    );
  }
}
