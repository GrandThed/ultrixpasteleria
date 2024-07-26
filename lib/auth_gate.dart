import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as provider;
import 'package:flutter/material.dart';
import 'package:ultrixpasteleria/screens/home/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<fba.User?>(
      stream: fba.FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return provider.SignInScreen(
            headerBuilder: (context, constraints, shrinkOffset) {
              return const Padding(
                padding: EdgeInsets.all(20),
                child: Text("Ultrix Pastry Shop"),
              );
            },
          );
        }

        return const Home();
      },
    );
  }
}
