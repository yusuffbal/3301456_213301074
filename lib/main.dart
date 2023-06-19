import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footballapp_2/Provider/BiletProvider.dart';
import 'package:footballapp_2/services/BiletService.dart';
import 'package:footballapp_2/services/FlutterFireAuthService.dart';
import 'package:footballapp_2/screens/LoginScreen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          Provider<FlutterFireAuthService>(
            create: (_) => FlutterFireAuthService(FirebaseAuth.instance),
          ),
       StreamProvider(
            create: (context) =>
                context.read<FlutterFireAuthService>().authStateChanges,
            initialData: null,
          ),
          ChangeNotifierProvider(create: (context) => BiletProvider()),
          StreamProvider(
            create: (context) =>
                context.read<BiletService>().getBiletler(),
            initialData: null,
          ),
          ChangeNotifierProvider<BiletService>(
          create: (_) => BiletService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Firebase Auth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/login': (context) => LoginPage(),
        },
        initialRoute: '/login',
      ),
    );
  }
}