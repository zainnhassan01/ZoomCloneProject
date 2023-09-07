import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomcloneproject/data%20models/userStream.dart';
import 'package:zoomcloneproject/screens/homewrapper.dart';
import 'package:zoomcloneproject/screens/login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserStreamModel?>(context);
    print(user);
    return user != null ? Home() : Login();
  }
}