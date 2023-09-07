import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomcloneproject/data%20models/userStream.dart';
import 'package:zoomcloneproject/screens/login.dart';
import 'package:zoomcloneproject/services/firebaseauth.dart';
import 'package:zoomcloneproject/utilities/colors.dart';
import 'package:zoomcloneproject/utilities/wrapper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MultiProvider(
    providers: [
      StreamProvider<UserStreamModel?>.value(value: AuthService().userStream, initialData: null)
    ],
    child: const MyApp()));   
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const Wrapper(),
    );
  }
}
