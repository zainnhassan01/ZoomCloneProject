
import 'package:flutter/material.dart';
import 'package:zoomcloneproject/services/firebaseauth.dart';
import 'package:zoomcloneproject/utilities/colors.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    
    void errorMessage (String? result){
      final showSnackBarWiget = SnackBar(content: Text("Login Error: $result"),);
      ScaffoldMessenger.of(context).showSnackBar(showSnackBarWiget);           
    }
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(30.0),
            child:  Center(
              child: Text(
                "Start or Join a Meeting",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Image.asset("assets/images/onboarding.jpg"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(
                  color: buttonColor,
                  style: BorderStyle.solid
                ),
                ),
              ),
              child: const Text(
                "Sign In",
              ),
              onPressed: () async {
                dynamic result = await AuthService().signInWithGoogle();
                if(result != null){
                  errorMessage(result);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
