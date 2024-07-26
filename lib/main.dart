import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as provider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultrixpasteleria/auth_gate.dart';
import 'package:ultrixpasteleria/firebase_options.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart'
    as providers;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  provider.FirebaseUIAuth.configureProviders([
    providers.GoogleProvider(
        clientId:
            "363949028736-ujarf83c5dlgidlvpoo5cll0p9gq9i34.apps.googleusercontent.com"),
  ]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthGate(),
      routes: {
        "profile": (context) {
          return const Scaffold(
            body: Text("profile"),
          );
        }
      },
    );
  }
}
