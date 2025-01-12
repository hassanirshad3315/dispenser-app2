import 'package:cooler/splashscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
Future main () async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC8AvLOjie8kkCAoxTE99iSPVG-a9pgXcc",
          authDomain: "flutter-firebase-78f36.firebaseapp.com",
          projectId: "flutter-firebase-78f36",
          storageBucket: "flutter-firebase-78f36.firebasestorage.app",
          messagingSenderId: "621642562303",
          appId: "1:621642562303:web:672665503c12771eef6aca"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body:Dispenser() ,
    ),
    ),
  );
}
class Dispenser extends StatefulWidget {
  const Dispenser({super.key});

  @override
  State<Dispenser> createState() => _DispenserState();
}

class _DispenserState extends State<Dispenser> {
  @override
  Widget build(BuildContext context) {
    return SplashPage();
  }
}
