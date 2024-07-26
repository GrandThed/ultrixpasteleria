import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as provider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ultrixpasteleria/auth_gate.dart';
import 'package:ultrixpasteleria/firebase_options.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart'
    as providers;
import 'package:ultrixpasteleria/screens/cart/cart_screen.dart';
import 'package:ultrixpasteleria/screens/pastry_detail/pastry_detail_screen.dart';

void main() async {
  // ignore: constant_identifier_names
  const GOOGLE_ID =
      String.fromEnvironment('GOOGLE_ID', defaultValue: 'GOOGLE_ID');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  provider.FirebaseUIAuth.configureProviders([
    providers.GoogleProvider(clientId: GOOGLE_ID),
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
        PastryDetailScreen.routeName: (context) {
          return const PastryDetailScreen();
        },
        CartScreen.routeName: (context) {
          return const CartScreen();
        }
      },
    );
  }
}
