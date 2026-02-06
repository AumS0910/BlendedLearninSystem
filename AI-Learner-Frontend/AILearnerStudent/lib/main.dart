import 'package:ailearner/services/AuthGate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDV7HtuZAQezNSBUqVOZ5GgRNFgHt3JJD0",
          appId: "1:868790377456:web:68446221da0d6f010adb35",
          messagingSenderId: "868790377456",
          projectId: "ai-learner-8069e"),
    );
  }

  await Firebase.initializeApp();

  Gemini.init(apiKey: "AIzaSyDkv9BTXNslgZqPcLVoxsGAP3Nlw9Uk9Ao");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Learner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Judson",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}
