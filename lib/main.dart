import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return MaterialApp(
            home: Scaffold(
              body: Text(snapshot.error.toString()),
            ),
          );

        if (snapshot.connectionState == ConnectionState.done)
          return MaterialApp(
            initialRoute: WelcomeScreen.id,
            routes: {
              WelcomeScreen.id: (context) => WelcomeScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen(),
              ChatScreen.id: (context) => ChatScreen(),
            },
          );

        return Scaffold(
          body: Center(
            child: SpinKitRotatingCircle(color: Colors.white, size: 100),
          ),
        );
      },
    );
  }
}
